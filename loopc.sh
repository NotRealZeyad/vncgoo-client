#!/bin/bash

# Function to handle the full exit
full_stop() {
    echo -e "\n[!] Full stop detected. Terminating script..."
    exit 0
}

# Trap SIGINT (Ctrl+C). 
# Note: In most terminals, Ctrl+A is not a signal, 
# so Ctrl+C is the standard way to "Full Stop".
trap full_stop SIGINT

echo "Starting loop. Press Ctrl+C to fully stop."

while true
do
    echo "[*] Launching main.go..."
    
    # Run your command
    go run main.go
    
    # Check if the program crashed or exited normally
    EXIT_CODE=$?
    
    if [ $EXIT_CODE -ne 0 ]; then
        echo "[!] Program crashed with exit code $EXIT_CODE. Rerunning in 2 seconds..."
    else
        echo "[*] Program finished normally. Restarting..."
    fi

    sleep 2
done
