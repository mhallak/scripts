#!/bin/sh

if [ -z "$1" ]
  then
    echo "Insert directory to check"
    exit 1
fi

MODEL_DIR=$1
cd $MODEL_DIR

DIR_LIST="`ls -d sampl_*/`"
echo DIR_LIST: ${DIR_LIST}

RESULT=""
for dir in ${DIR_LIST}
do
   mkdir ../$dir
   err_code=$?
   if [ $err_code -ne 0 ]
        then
          echo "Directory already exists"
          exit 1
   fi
   cp -r $dir/scenarioSystemModels ../$dir/scenarioSystemModels
   cp    $dir/scen.SFV  ../$dir/scen.SFV
   cp    $dir/scenario* ../$dir
done

cd ../

for dir in ${DIR_LIST}
do
   roslaunch SRVSS --pid=/tmp/srvsspid runScenario_robil2.launch scen:=work_space/$dir &
  # tpid=$!
  # echo $tpid > /tmp/pid
  # echo $$ > /tmp/ppid
   sleep 600
  #  kill -9 $tpid
   kill -INT `cat /tmp/srvsspid`
   sleep 60
done
exit 0

