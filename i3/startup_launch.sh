#!/bin/bash

# Define monitor outputs
PRIMARY="HDMI-0"
SECONDARY="DVI-D-0"

# Function to create workspace on specified monitor and launch application
create_workspace_and_launch() {
    workspace=$1
    monitor=$2
    application=$3
    wait_time=${4:-5}  # Default wait time is 3 seconds, can be overridden

    # Create workspace and move it to specified monitor
    i3-msg "workspace $workspace; move workspace to output $monitor"

    # Launch application
    i3-msg "exec --no-startup-id $application"

    # Wait for application to start
    sleep $wait_time

    # Ensure application window is on the correct workspace
    i3-msg "[workspace=$workspace] move workspace to output $monitor"
}

# Workspace 1 on HDMI-0 with terminal
create_workspace_and_launch 1 $PRIMARY "i3-sensible-terminal"

# Workspace 2 on HDMI-0 with Firefox
create_workspace_and_launch 2 $PRIMARY "firefox"

# Workspace 3 on DVI-D-0 with Discord (increased wait time to 10 seconds)
create_workspace_and_launch 3 $SECONDARY "discord" 8

# Workspace 4 on DVI-D-0 with Firefox
create_workspace_and_launch 4 $SECONDARY "firefox"

# Focus on workspace 1 at the end
i3-msg "workspace 1"
