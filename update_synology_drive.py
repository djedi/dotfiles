#!/usr/bin/env python

import yaml
import json
import shutil

# Open the YAML file and load its contents into the config variable
with open("synology_drive_conf.yaml", encoding="utf-8") as file:
    config = yaml.load(file, Loader=yaml.SafeLoader)

for filename in ("filter", "filter-v4150"):
    # Open the output file for writing
    with open(filename, "w", encoding="utf-8") as file:
        # Loop over the sections in the config dictionary
        for section_name, section in config.items():
            # Write the section header to the output file
            file.write(f"[{section_name}]\n")
            # Check if the section is None
            if section is not None:
                # Loop over the keys and values in the section dictionary
                for key, value in section.items():
                    # Check if the value is a list
                    if isinstance(value, list):
                        # If the value is a list, convert each element to a JSON string and join them with commas
                        value = [json.dumps(v) for v in value]
                        file.write(f"{key} = {', '.join(value)}\n")
                    else:
                        # If the value is not a list, check if it's a number (int or float)
                        if not isinstance(value, (int, float)):
                            if key == "black_char" and filename == "filter-v4150":
                                value = "\\/"
                            # If the value is not a number, convert it to a JSON string
                            value = json.dumps(value)
                        # Write the key and value to the output file
                        file.write(f"{key} = {value}\n")
            # Write a newline to the output file to separate sections
            file.write("\n")

    # Move filename to ~/Library/Application Support/SynologyDrive/SynologyDrive.app/Contents/Resources/conf
    shutil.move(
        filename,
        f"/Users/dustin/Library/Application Support/SynologyDrive/SynologyDrive.app/Contents/Resources/conf/{filename}",
        copy_function=shutil.copy2,
    )
