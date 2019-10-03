echo "Select one of the environment...Attention, there is an accumulative effect!"
echo "alias tf=source /home/robil/.tensor"
echo "alias rob=source /home/robil/.robilenv"
echo "alias cond=source /home/robil/.condaenv"
echo "alias convoy=source /home/robil/.convoyenv"
#echo "alias u3=source /home/robil/.unity3dmic"
alias 'tf=source /home/robil/.tensor'
alias 'rob=source /home/robil/.robilenv'
alias 'u3=source /home/robil/.unity3dmic'
alias 'cond=source /home/robil/.condaenv'
alias 'convoy=source /home/robil/.convoyenv'
alias a=alias
alias h=history
alias j=jobs
alias d=date
alias rm='rm -i'
alias ver='lsb_release -a'
alias resenv='source ~/.bashrc'
#problem that libGL.so is linked to mesa and not nvidia
export LD_LIBRARY_PATH=/usr/lib/nvidia-384:${LD_LIBRARY_PATH}
export NDDSHOME=/home/robil/rti_connext_dds-5.3.1
#source ~/.dotnetsh
alias path='(IFS=:;ls -1d $PATH |  nl)'
sl
