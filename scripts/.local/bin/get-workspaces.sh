#!/bin/bash
i3-msg -t get_workspaces | jq -r 'map(.name + (if .focused then "*" else "" end)) | join(" ")'

