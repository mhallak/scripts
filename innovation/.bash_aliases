alias a=alias
alias h=history
alias j=jobs
alias d=date
alias rm='rm -i'
alias ver='lsb_release -a'
alias resenv='source ~/.bashrc'
#problem that libGL.so is linked to mesa and not nvidia
alias path='(IFS=:;ls -1d $PATH |  nl)'
source ~/.git-completion.bash
source /opt/ros/melodic/setup.bash
#export ROS_PYTHON_VERSION=3
export PATH="/home/sload/scripts/shellscripts:$PATH"
#sl
alias charm="bash -i -c \"/home/sload/.local/share/JetBrains/Toolbox/apps/PyCharm-C/ch-0/193.6494.30/bin/pycharm.sh\" %f"
fortune
