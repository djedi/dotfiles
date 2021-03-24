#!/usr/bin/env osascript -l JavaScript

function run(argv) {
	if (argv.length !== 2) {
		console.log("Usage: ./staymounted.js <serverName> <volumeName>");
		console.log("Example: ./staymounted.js MySynology media");
		return;
	}
	const serverName = argv[0];
	const volName = argv[1];

	const app = Application.currentApplication();
	app.includeStandardAdditions = true;
	const system = Application("System Events");

	let volMounted = false;

	const volList = system.disks();
	volList.forEach((vl) => {
		if (vl.name() == volName) {
			volMounted = true;
		}
	});

	if (!volMounted) {
		try {
			app.displayNotification("Mounting: '" + volName + "'");
			app.mountVolume(volName, { onServer: serverName });
		} catch (err) {
			app.displayNotification("Mount failed: " + err);
		}
	}
}
