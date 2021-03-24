#!/usr/bin/env osascript -l JavaScript

// ***********************************************
// DLI_ReMounter JavaScript for Mac OS X
// by Michael Scaramozzino - DreamLight.com
// ***********************************************
// Michael Scaramozzino and DreamLight Incorporated
// make no warranties whatsoever regarding this script.
// For educational purposes only. USE AT YOUR OWN RISK!
// ***********************************************
// USAGE:

// Open in Apple's Script Editor
// Edit the volName and serverName USER VARIABLES
// Export As application
// With 'Stay open after Run handler' checked.
// Double-click to launch application.

// ***********************************************
// USER VARIABLES

var tIdleSeconds = 30; 					// set to seconds to wait between checks
var volName = "Media" 				// set volume name to mount
var serverName = "DavisSynology" 			// set server name

// ***********************************************
// APPLICATION HANDLERS

var app = Application.currentApplication();		// Link to current application
app.includeStandardAdditions = true;			// Activate StandardAdditions
var system = Application('System Events');		// Load System Events


function idle() { 					// Called at designated idle intervals
	checkVolumes();
    return tIdleSeconds; 				// next idle interval call
};

// ***********************************************
// UTILITY HANDLERS

function checkVolumes() {
	var volMounted = false; 			// start with mount flag false

	var volList = system.disks(); 			// get list of mounted volumes from system
	for (i = 0; i < volList.length; i++) { 		// check each mounted volume
		if (volList[i].name() == volName){ 	// volume name matches
			volMounted = true; 		// volume is mounted
			break;				// end loop
		};
	};

	if ( ! volMounted ) { 				// if not mounted, try to mount it
		try {
			app.displayNotification( "Mounting: '" + volName + "'" );
			app.mountVolume( volName, {onServer: serverName} );
		} catch (err) {
			app.displayNotification( 'Mount failed: ' + err );
		};
	};
};
