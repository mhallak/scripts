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
fortune
