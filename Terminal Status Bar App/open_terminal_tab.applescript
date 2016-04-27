try
	tell application "Finder" to set current_directory to quoted form of POSIX path of (target of window 1 as alias)
	tell application "Terminal"
		activate
		-- based on http://apple.stackexchange.com/questions/15317/how-can-i-write-a-script-to-open-multiple-terminal-tabs-and-execute-code-in-them
		-- Get a window that's not busy.
		if (count of windows) is greater than 0 then
			repeat with currentWindow in windows
				if currentWindow is not busy then
					set targetWindow to currentWindow
				end if
			end repeat
		end if
		--if Terminal is currently open, open new tab
		-- Open a new tab.
		set terminalCommand to "cd " & current_directory
		try
			get targetWindow
			tell application "System Events" to tell process "Terminal" to keystroke "t" using command down
			do script terminalCommand in targetWindow
		on error
			do script terminalCommand
		end try
		
	end tell
	on error
	beep
end try
return input