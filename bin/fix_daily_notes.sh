#!/usr/bin/env zsh

today=$(date +%m-%d-%Y)
sed -i 'old' -E "s/[0-9-]{10}/$today/" \
  "/Users/dustin/Applications/Brave Browser Apps.localized/DailyNotes.app/Contents/Info.plist"