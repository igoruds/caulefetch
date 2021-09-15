#!/usr/bin/env bash

display_info(){

	d_title=$USER@$HOSTNAME
	d=$(uname -a | awk '{print $2}')
	d_os=$(uname -o)
	d_kname=$(cat /proc/sys/kernel/ostype)
	d_kversion=$(cat /proc/sys/kernel/osrelease)
	d_shell=$(basename $SHELL)
	d_res=$(xrandr | sed -n '1p' | sed 's/.*current.//g;s/,.*//g;s/ //g')
	d_desk=$XDG_SESSION_DESKTOP
	d_cpu=$(cat /proc/cpuinfo | grep -o 'model name.*' | sed -n 1p | sed 's/.*:.//g;s/(.*)//g')
	d_mem=$(echo $(cat /proc/meminfo | sed -n 1p | tr -d [A-Za-z:' ']) / 1000000 | bc)" GB"
	
}

set_info(){
display_info
cat <<EOF

$d_title
Distro: ${d^}
OS: $d_os
Kernel Name: $d_kname
Kernel Version: $d_kversion
Shell: ${d_shell^}
Resolution: $d_res
Desk: $d_desk
CPU: $d_cpu
RAM: $d_mem



EOF
}

logo="
 ⣿⣿⣿⣿⣿⡟⣛⡻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
 ⣿⣿⣿⣿⣿⣇⠘⢿⣦⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
 ⣿⣿⣿⠿⠿⣿⣷⠰⣽⣶⣮⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⢟⣥⣴⣶⣶⣦⣍⢿⣿
 ⣿⣿⣏⠉⢷⣌⢿⣷⡌⢿⡿⣗⡹⣿⣿⣿⢛⣭⣩⣽⢦⡚⣭⡹⣿⣿⣿⣿⡆⢿
 ⣿⣿⣿⣦⠨⣫⣮⣝⢿⣌⢿⣿⣿⡝⣿⣿⢸⡿⡝⢇⠿⡇⣿⣷⣭⣛⠻⠇⠇⣾
 ⣿⣿⣿⣿⣷⣝⢿⣿⣃⣻⢧⠹⣿⣿⡘⡇⡇⠂⣠⣶⣤⣦⡁⠻⣿⣿⡇⠄⢠⣿
 ⣿⣿⣿⣿⣿⣿⣧⡡⣿⣿⣷⡀⠘⠿⣿⠖⣠⣾⣿⣿⣿⣿⣿⢰⣤⣴⣧⢠⣿⣿
 ⡿⣛⣛⠿⣿⣿⣿⣿⣮⡻⣿⡟⠄⠈⢁⣼⣿⣿⣿⣿⣿⣿⠏⠄⡻⣿⣿⡆⣿⣿
 ⣇⣋⠙⢿⣶⣮⣝⡛⠿⢿⡀⠇⠄⣰⣿⣿⣿⣿⣿⣿⡿⠁⢠⣴⣾⣾⣿⡇⣼⣿
 ⣿⣿⣷⣬⣋⣙⠻⣵⣿⣿⡶⢀⣾⣿⣿⣿⣿⣿⣿⠏⠄⠠⣿⣿⣿⣿⡏⠃⣿⣿
 ⣿⣿⣿⣿⣿⣿⣿⣮⣙⠙⣰⣿⣿⣿⣿⣿⣿⣿⠋⠂⠄⣼⣿⣿⣿⣿⠁⢰⣿⣿
 ⣿⣿⣿⣿⣿⣿⣿⣿⠏⣴⣿⣿⣿⣿⣿⣿⡿⠃⠄⢀⢲⣿⣿⣿⣿⡇⠄⣾⣿⣿
 ⣿⣿⣿⣿⣿⣿⣿⢋⣾⣿⣿⣿⣿⣿⣿⡿⠁⠁⢠⣿⣮⣻⣿⣿⣿⣵⡜⢿⣿⣿
 ⣿⣿⣿⣿⣿⣿⢃⣾⣿⣿⣿⣿⣿⣿⡟⠐⠄⣠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡹⢿
 ⣿⣿⣿⣿⣿⢃⣾⣿⣿⣿⣿⣿⣿⡟⠐⣀⠐⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣮

"
#printf "%s" "$logo"
#set_info
paste <(printf "%s" "$logo") <(set_info)

