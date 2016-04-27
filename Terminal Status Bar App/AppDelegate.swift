//
//  AppDelegate.swift
//  Terminal Status Bar App
//
//  Created by Allen Xavier on 4/26/16.
//  Copyright (c) 2016 Allen Garvey. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

	@IBOutlet weak var statusMenu: NSMenu!
	//NSVariableStatusItemLength = -1 and there is a bug with using it
	let statusBar = NSStatusBar.systemStatusBar().statusItemWithLength(-1)
	let terminalExecuter = TerminalExecuter()

	func applicationDidFinishLaunching(aNotification: NSNotification) {
		statusBar.title = ":>"
		statusBar.menu = statusMenu
		statusBar.highlightMode = true
	}

	func applicationWillTerminate(aNotification: NSNotification) {
		// Insert code here to tear down your application
	}
	
	@IBAction func showInTerminal(sender: AnyObject) {
		terminalExecuter.openCurrentFinderInTerminal()
	}


}

