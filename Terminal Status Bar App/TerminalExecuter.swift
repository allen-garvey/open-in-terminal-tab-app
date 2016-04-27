//
//  TerminalExecuter.swift
//  Terminal Status Bar App
//
//  Created by Allen Xavier on 4/26/16.
//  Copyright (c) 2016 Allen Garvey. All rights reserved.
//

import Foundation
import Cocoa


class TerminalExecuter {
	let scriptPath : String = "open_terminal_tab"
	let script : String?
	var appleScript : NSAppleScript? = nil
	init(){
		script = TerminalExecuter.scriptFileContents(scriptPath)
		if(script != nil){
			appleScript = NSAppleScript(source: script!)
		}
	}
	
	func openCurrentFinderInTerminal(){
		if(appleScript != nil){
			appleScript!.executeAndReturnError(nil)
		}
	}
	
	class func scriptFileContents(path: String) -> String?{
		let filePath : String? = NSBundle.mainBundle().pathForResource(path, ofType: "applescript")
		if(filePath != nil){
			var error : NSError?
			let contents : String? = String(contentsOfFile: filePath!, encoding: NSUTF8StringEncoding, error: &error)
			if(contents != nil){
				return contents
			}
		}

		return nil
	}
}