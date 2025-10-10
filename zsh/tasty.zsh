# Function to query API endpoint once per day
function refresh_tasty_cust_list() {
  # Set the path for the timestamp file
  timestamp_file="$HOME/.api_last_query_timestamp"
  tasty_custs_file="$HOME/.tasty_custs"

  # Get the current date
  current_date=$(date "+%Y-%m-%d")

  # Check if the timestamp file exists
  if [ -e "$timestamp_file" ]; then
    # Read the last query date from the timestamp file
    last_query_date=$(cat "$timestamp_file")

    # Compare the last query date with the current date
    if [[ "$last_query_date" == "$current_date" ]]; then
      # API already queried today, do nothing
      echo "API already queried today. Skipping."
      cat $tasty_custs_file | read -r TASTY_CUSTS
    else
      # Query the API
      echo "Querying API..."
      fetch_and_set_tasty_env

      # Update the timestamp file with the current date
      echo "$current_date" > "$timestamp_file"
    fi
  else
    # Timestamp file doesn't exist, query the API
    echo "Querying API for the first time..."
    fetch_and_set_tasty_env

    # Create the timestamp file and write the current date
    echo "$current_date" > "$timestamp_file"
  fi
}

function fetch_and_set_tasty_env() {
  local json_response=$(curl -s -L 'https://tasty.winepos.com/api/merchants' -u "$TASTY_EMAIL:$TASTY_PASSWORD")

  # Check if jq is installed
  if command -v jq &> /dev/null; then
    # Extract all "code" values and set as an array ENV variable
    export TASTY_CUSTS=($(echo "$json_response" | jq -r '.[].code'))
    echo $TASTY_CUSTS > "$tasty_custs_file"
  else
    echo "jq is not installed. Please install jq to parse JSON."
  fi
}

# Set list of tasty customers to env variable
refresh_tasty_cust_list

# Function to add Tasty Custs to a script
# More info: https://zsh.sourceforge.io/Doc/Release/Completion-System.html
_tastyCusts() {
    local curcontext=$curcontext state line
    typeset -A opt_args

    # Use the values from the environment variable SCRIPT_OPTIONS for completion
    _arguments -C \
        '1:script:->script' && return 0

    _wanted script expl 'script' \
        compadd $(print -l $TASTY_CUSTS)
}

# Actually add Tasty Custs to a script for tab completion
compdef _tastyCusts tastyStatus
