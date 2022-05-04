向日葵+KDE(sddm)无法在输入密码登录前开启远程控制的问题的解决方案
===================

### 适用问题
- 使用KDE，以sddm作为Display Manager（除非你特殊调整过，KDE默认就是sddm）
- 物理机完成用户登录、进入桌面后可以正常使用向日葵
- 但如果不进行登录，在输入密码页面向日葵无法启动远程控制，一直卡在“正在进入远程桌面”

### 使用方法
只需克隆项目，sudo执行`install.sh`即可：
```shell
git clone https://github.com/Starrah/sunlogin-xhost-fix
cd sunlogin-xhost-fix
chmod u+x install.sh
sudo ./install.sh
```

若要卸载本程序，只需sudo执行项目中的`uninstall.sh`。

### 问题分析
xhost是X server用于控制允许哪些client连入的机制。默认情况下，KDE只会允许本机的当前用户连入：
```shell
xhost
# 输出例如：
# access control enabled, only authorized clients can connect
# SI:localuser:ubuntu
```
向日葵远程控制的原理是用一个X client连接到X server。用户登录完成以后，这个X client是以用户的身份开启的，因而可以正常使用；
但是，在用户完成登录之前，向日葵所用的X client是以root这个用户开启的，因此在尝试连接时会被拒绝。
本程序的原理是在X server启动之后，立即执行`xhost +SI:localuser:root`，将root用户加入允许列表中。
