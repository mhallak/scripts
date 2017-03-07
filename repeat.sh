#!/bin/sh

if [ -z "$1" ]
  then
    echo "Insert directory to check"
    exit 1
fi

MODEL_DIR=$1
cd $MODEL_DIR

DIR_LIST="`ls -v `"
echo DIR_LIST: ${DIR_LIST}

for dir in ${DIR_LIST}
do
  echo "Copying $dir"
   mkdir ../$dir
   err_code=$?
   if [ $err_code -ne 0 ]
	then
	  echo "Directory already exists"
          exit 1
   fi
   #cp -ar $dir/scenarioSystemModels ../$dir/scenarioSystemModels
   cp    $dir/scen.SFV  ../$dir/scen.SFV
   cp  -a -r  $dir/scenario* ../$dir
#   cp -a -r $dir/scenarioSystemModels ../$dir
done

cd ../
rm -f superGrades.txt

echo "Starting executing scenarios"

for dir in ${DIR_LIST}
do
  echo "Execute scenario $dir"
   roslaunch smartest --pid=/tmp/srvsspid runScenario_robil2.launch scen:=$dir  1>&2  > $dir/log.txt &
  sleep 300
  rostopic echo -n 1 /srvss/grades  > $dir/grades.txt &
  tpid=$!
  sleep 15
  cat $dir/grades.txt >> superGrades.txt
  #  kill -9 $tpid
   kill -INT `cat /tmp/srvsspid`
   sleep 60
   kill -INT $tpid
   
 
done
exit 0
