on run {input, parameters}
	
	# ��������
	tell application "Terminal"
		set dialog to display dialog "Whether or not to switch proxy?" buttons {"ON", "OFF", "Cancel"} default button "ON" with title "Local Proxy Switcher"
		set interface to button returned of dialog
	end tell
	
	# �������Cancel����رմ���
	if interface is "Cancel" then
		tell application "Terminal"
			do script "killall Terminal"
		end tell
	end if
	
	# �������ON����ִ�г��򣬲�����������
	if interface is "ON" then
		tell application "Terminal"
			do script "python goagent/local/proxy.py"
		end tell
		
		# ������ҳ����HTTP��
		do shell script "networksetup -setwebproxy Wi-Fi 192.168.1.8 8087"
		# ���ð�ȫ��ҳ����HTTPS��
		do shell script "networksetup -setsecurewebproxy Wi-Fi 192.168.1.8 8087"
		
		do shell script "networksetup -setwebproxystate Wi-Fi on"
		do shell script "networksetup -setsecurewebproxystate Wi-Fi on"
	end if
	
	# �������OFF����ִ�г��򣬲����رմ���
	if interface is "OFF" then
		tell application "Terminal"
			do script "killall Terminal"
		end tell
		
		do shell script "networksetup -setwebproxystate Wi-Fi off"
		do shell script "networksetup -setsecurewebproxystate Wi-Fi off"
	end if
	return input
end run