try
	tell application "Finder" to set current_directory to quoted form of POSIX path of (target of window 1 as alias)
	tell application "Terminal"
		activate
		do script "cd " & current_directory
	end tell
	on error
	beep
end try
return input