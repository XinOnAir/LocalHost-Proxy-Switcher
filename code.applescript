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
