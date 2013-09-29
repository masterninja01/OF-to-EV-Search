tell application "OmniFocus"
	-- Target the content of the front window
	tell content of front window
		try
			set theTrees to selected trees
			
			if (count of theTrees) < 1 then
				set theTrees to selected trees of sidebar
			end if
			
			if (count of theTrees) < 1 then
				return
			end if
			
			set theSelection to value of item 1 of theTrees
			
			if class of theSelection is folder then
				set theURI to id of theSelection
			else if class of theSelection is project then
				set theURI to id of theSelection
			else
				set theTask to id of theSelection
				set theProj to id of (the containing project of theSelection)
				set theURI to "any:" & theTask & " " & theProj
			end if
		end try
	end tell
	tell application "Evernote"
		open collection window with query string theURI
		activate
	end tell
end tell
