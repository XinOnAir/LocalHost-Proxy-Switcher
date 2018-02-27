on run {input, parameters}
<<<<<<< HEAD
	
	# ½¨Á¢´°Ìå
=======

	# å»ºç«‹çª—ä½“
>>>>>>> c00b72402dfa2fcc09c4064f658a5852bee4fc54
	tell application "Terminal"
		set dialog to display dialog "Whether or not to switch proxy?" buttons {"ON", "OFF", "Cancel"} default button "ON" with title "Local Proxy Switcher"
		set interface to button returned of dialog
	end tell
<<<<<<< HEAD
	
	# Èôµã»÷¡°Cancel¡±Ôò¹Ø±Õ´°Ìå
=======

	# è‹¥ç‚¹å‡»â€œCancelâ€åˆ™å…³é—­çª—ä½“
>>>>>>> c00b72402dfa2fcc09c4064f658a5852bee4fc54
	if interface is "Cancel" then
		tell application "Terminal"
			do script "killall Terminal"
		end tell
	end if
<<<<<<< HEAD
	
	# Èôµã»÷¡°ON¡±ÔòÖ´ÐÐ³ÌÐò£¬²¢½«¿ªÆô´úÀí
=======

	# è‹¥ç‚¹å‡»â€œONâ€åˆ™æ‰§è¡Œç¨‹åºï¼Œå¹¶å°†å¼€å¯ä»£ç†
>>>>>>> c00b72402dfa2fcc09c4064f658a5852bee4fc54
	if interface is "ON" then
		tell application "Terminal"
			do script "python goagent/local/proxy.py"
		end tell
<<<<<<< HEAD
		
		# ÉèÖÃÍøÒ³´úÀí£¨HTTP£©
		do shell script "networksetup -setwebproxy Wi-Fi 192.168.1.8 8087"
		# ÉèÖÃ°²È«ÍøÒ³´úÀí£¨HTTPS£©
		do shell script "networksetup -setsecurewebproxy Wi-Fi 192.168.1.8 8087"
		
		do shell script "networksetup -setwebproxystate Wi-Fi on"
		do shell script "networksetup -setsecurewebproxystate Wi-Fi on"
	end if
	
	# Èôµã»÷¡°OFF¡±ÔòÖ´ÐÐ³ÌÐò£¬²¢½«¹Ø±Õ´úÀí
=======
	
		# è®¾ç½®ç½‘é¡µä»£ç†ï¼ˆHTTPï¼‰
		do shell script "networksetup -setwebproxy Wi-Fi 192.168.1.8 8087"
		# è®¾ç½®å®‰å…¨ç½‘é¡µä»£ç†ï¼ˆHTTPSï¼‰
		do shell script "networksetup -setsecurewebproxy Wi-Fi 192.168.1.8 8087"
	
		do shell script "networksetup -setwebproxystate Wi-Fi on"
		do shell script "networksetup -setsecurewebproxystate Wi-Fi on"
	end if

	# è‹¥ç‚¹å‡»â€œOFFâ€åˆ™æ‰§è¡Œç¨‹åºï¼Œå¹¶å°†å…³é—­ä»£ç†
>>>>>>> c00b72402dfa2fcc09c4064f658a5852bee4fc54
	if interface is "OFF" then
		tell application "Terminal"
			do script "killall Terminal"
		end tell
	
		do shell script "networksetup -setwebproxystate Wi-Fi off"
		do shell script "networksetup -setsecurewebproxystate Wi-Fi off"
	end if
	return input
end run
