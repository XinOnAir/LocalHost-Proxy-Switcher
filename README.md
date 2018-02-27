# LocalHost-VPN-Switcher


系统要求：MacOS


说明：一个可以方便来回切换本地网络代理的轻量软件。


初衷：

	1.需要频繁切换网络代理地址；
	2.某些公司网络或代理运营商的网络自带防火墙，导致一些科学上网工具无法正常使用；
	3.公司或他人有特定的代理地址分享给你时，便需要此工具来作为运行载体；


情景：

	1.公司给每个人分配了一个科学上网的代理地址，如果自身使用的话，需要在“系统偏好设置”-“网络”-“Wi-Fi”-“高级”里面设置代理；关闭代理时则需要继续以上步骤；
	2.某些代理IP访问国内网络并不友好，便需要切换回本地默认地址，这就增加了很冗长的工作；
	3.使用此程序，只需要在代码中添加好需要设置的代理地址，即可一劳永逸的来回切换；
	

代码：

	on run {input, parameters}
	
		# 建立窗体
		tell application "Terminal"
			set dialog to display dialog "Whether or not to switch proxy?" buttons {"ON", "OFF", "Cancel"} default button "ON" with title "Local Proxy Switcher"
			set interface to button returned of dialog
		end tell
	
		# 若点击“Cancel”则关闭窗体
		if interface is "Cancel" then
			tell application "Terminal"
				do script "killall Terminal"
			end tell
		end if
	
		# 若点击“ON”则执行程序，并将开启代理
		if interface is "ON" then
			tell application "Terminal"
				do script "python goagent/local/proxy.py"
			end tell
		
			# 设置网页代理（HTTP）
			do shell script "networksetup -setwebproxy Wi-Fi 192.168.1.8 8087"
			# 设置安全网页代理（HTTPS）
			do shell script "networksetup -setsecurewebproxy Wi-Fi 192.168.1.8 8087"
		
			do shell script "networksetup -setwebproxystate Wi-Fi on"
			do shell script "networksetup -setsecurewebproxystate Wi-Fi on"
		end if
	
		# 若点击“OFF”则执行程序，并将关闭代理
		if interface is "OFF" then
			tell application "Terminal"
				do script "killall Terminal"
			end tell
		
			do shell script "networksetup -setwebproxystate Wi-Fi off"
			do shell script "networksetup -setsecurewebproxystate Wi-Fi off"
		end if
		return input
	end run


使用：

	1.在“自动操作（Automator）”软件中，打开“LocalHost VPN Switcher.app”;	
	2.AppleScript中修改代理地址（格式如：“192.168.1.8 8087”，注意有IP与端口之间有空格）；	
	3.保存；
	4.双击打开“LocalHost VPN Switcher.app”，开始使用！


伙伴：

	1.请志同道合的朋友一起优化此程序；
	2.本人已设计出界面，但不擅长Xcode封装成APP；
	3.需要同时开发出适用于其他系统（Windows）的程序；
	4.根据界面增加部分功能，目的在于更加方便的使用程序；
	5.本着开源共享的初衷，任何合作开发行为均以免费自愿的原则进行；


界面：

![image](https://github.com/XinOnAir/LocalHost-VPN-Switcher/raw/master/preview/LVS_A01_home.png)

![image](https://github.com/XinOnAir/LocalHost-VPN-Switcher/raw/master/preview/LVS_A02_saved.png)

![image](https://github.com/XinOnAir/LocalHost-VPN-Switcher/raw/master/preview/LVS_A03_new.png)
