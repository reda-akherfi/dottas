

if [ "$(tty)" = "/dev/tty1" ];then
  exec Hyprland 1>> ~/temp/hyprland_log_stdout.log 2>> ~/temp/hyprland_log_stderr.log
fi

