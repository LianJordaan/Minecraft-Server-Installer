#!/bin/bash

# Check if server.jar exists
if [ ! -f "server.jar" ]; then
    # Download server.jar
    wget -O server.jar https://api.purpurmc.org/v2/purpur/1.20.2/2095/download
    
    # Create eula.txt and agree to EULA
    echo "eula=true" > eula.txt
fi

# Start the server
java -Xms1G -Xmx4G -jar server.jar nogui
