#!/bin/bash

# Prompt the user for a folder name
echo "Enter a folder name to store the server files:"
read folder_name

# Save the folder name to a file
echo "$folder_name" > ~/.foldername

# Check if the server.jar file exists
if [ ! -f "$folder_name/server.jar" ]; then
    # Download the server.jar file
    echo "Downloading server.jar..."
    wget -O "$folder_name/server.jar" https://api.purpurmc.org/v2/purpur/1.20.2/2095/download
fi

# Check if the eula.txt file exists
if [ ! -f "$folder_name/eula.txt" ]; then
    # Create eula.txt and agree to the EULA
    echo "eula=true" > "$folder_name/eula.txt"
fi

# Start the server
echo "Starting the server..."
cd "$folder_name"
java -Xms1G -Xmx4G -jar server.jar nogui
