alias a=alias
alias h=history
alias j=jobs
alias d=date
alias rm='rm -i'
alias ver='lsb_release -a'
alias path='(IFS=:;ls -1d $PATH |  nl)'

#Allow core dump
ulimit -c unlimited
#export PATH="/home/robil/giteye:/home/robil/scripts:/home/robil/scripts/python:/usr/local/bin:/usr/share:$PATH"
#export PATH="/opt/Unity/Editor/:/opt/Unity/Editor/Data/Mono/bin:/home/robil/scripts:/home/robil/scripts/python:/usr/local/bin:/usr/share:$PATH"
export PATH="/home/robil/scripts/shellscripts:/home/robil/scripts/python:$PATH"
export PATH=$PATH:/opt/gradle/gradle-6.5.1/bin
export PATH="$HOME/Fast-DDS-Gen/scripts":$PATH

export EDITOR='vi'

export JAVA_HOME=$(readlink -f /usr/bin/javac | sed "s:bin/javac::")
export ROBILX=/home/robil/git/ws/src/robil3

source ~/.git-completion.bash
#source $ROBILX/devel/setup.bash
alias mel="source /opt/ros/melodic/setup.bash"
alias elq="source /opt/ros/eloquent/setup.bash"
alias rfr="source install/setup.bash"
#source /home/robil/git/ws/devel/setup.bash
#rosdep install -i --from-path src --rosdistro eloquent -y
alias r1="source /home/robil/git/ws/devel/setup.bash;PS1='<ros1>$PS1'"
alias resenv="source /etc/environment;source /etc/profile;source /etc/profile.d/*;source ~/.bashrc"
alias r2="source $HOME/git/ros2ws/install/setup.bash;PS1='<ros2>$PS1'"
#alias r2="source /opt/ros/eloquent/setup.bash;PS1='<ros2>$PS1'"
alias br="source $HOME/scripts/shellscripts/ros1ros2bridge.sh"


export GIT_MERGE_AUTOEDIT=no
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH

export RUNGAZ=$(which gazebo)
export CLANG=/opt/clang

#export ROS_PYTHON_VERSION=3
#sl
alias charm="bash -i -c \"/snap/pycharm-community/current/bin/pycharm.sh\" %f"
#alias charm="bash -i -c \"/home/sload/.local/share/JetBrains/Toolbox/apps/PyCharm-C/ch-0/193.6494.30/bin/pycharm.sh\" %f"
#sl
fortune
