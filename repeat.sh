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
   cp -r $dir/scenarioSystemModels ../$dir/scenarioSystemModels
   cp    $dir/scen.SFV  ../$dir/scen.SFV
   cp    $dir/scenario* ../$dir
done

cd ../

for dir in ${DIR_LIST}
do
   roslaunch SRVSS runScenario_robil2.launch scen:=work_space/$dir
   pid=$!
   sleep 600
   kill -9 $pid
done
exit 0

