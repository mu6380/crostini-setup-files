echo -n "Enter the number of screens you will be using [1] or [2]: "
read userinput
if [[ "$userinput" == "1" ]]
then

	echo -n "Enter whether you are using [monitor] or [embedded] screen: "
	read screeninput
	if [[ "$screeninput" == "monitor" ]]
	then
	
		echo "Launching monitor screen setup..."
		unset XDG_RUNTIME_DIR
		xinit ~/.xinitrc -- /usr/bin/Xephyr +iglx -br -ac -dumbSched -screen 1980x1080 -resizeable +xinerama :2 &
		
	elif [[ "$screeninput" == "embedded" ]]
	then
	
		echo "Launching embedded screen setup..."
		unset XDG_RUNTIME_DIR
		xinit ~/.xinitrc -- /usr/bin/Xephyr +iglx -br -ac -dumbSched -screen 2400x1350 -resizeable +xinerama :2 &
		
	else
	
		echo "You entered an invalid input, exiting..."
		exit 2
		
	fi

elif [[ "$userinput" == "2" ]]
then
	echo "Launching default 2 monitor setup"
	unset XDG_RUNTIME_DIR
	xinit ~/.xinitrc -- /usr/bin/Xephyr +iglx -br -ac -dumbSched -screen 1980x1080 -resizeable -screen 2400x1350 -resizeable +xinerama :2 &
	
elif [[ "$userinput" == "exit" ]]
then
	exit 1
else
	echo "You entered an invalid input, exiting..."
fi