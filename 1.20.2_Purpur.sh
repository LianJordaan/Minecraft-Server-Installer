#!/bin/bash

# Prompt the user for a folder name
echo "Enter a folder name to store the server files:"
read folder_name

mkdir -p "$folder_name"

# Check if the server.jar file exists
if [ ! -f "$folder_name/server.jar" ]; then
    # Download the server.jar file
    echo "Downloading server.jar..."
    wget -O "$folder_name/server.jar" https://api.purpurmc.org/v2/purpur/1.20.2/2095/download
fi
touch "$folder_name/eula.txt"
# Check if the eula.txt file exists
echo "eula=true" > "$folder_name/eula.txt"

touch "$folder_name/start.sh"
# Check if the start.sh file exists
echo "java -Xms1G -Xmx4G -jar server.jar nogui" > "$folder_name/start.sh"

# Start the server
echo "Starting the server..."
cd "$folder_name"

sh start.sh
