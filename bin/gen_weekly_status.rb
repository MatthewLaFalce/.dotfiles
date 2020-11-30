#!/usr/bin/ruby

require "faraday"
require "json"
require 'tempfile'

# Example usage: ruby gen_weekly_status.rb github_username github_token column_id user@gmail.com

GITHUB_USER = ARGV[0]         # Github username
GITHUB_TOKEN = ARGV[1]        # Github personal access token
GITHUB_COLUMN_ID = ARGV[2]    # Github Project column id
RECEIVER_EMAIL = ARGV[3]      # Destination Email Address
GITHUB_URL = "https://api.github.com/projects/columns/#{GITHUB_COLUMN_ID}/cards"

# Create a new connection object
connection = Faraday.new
connection.basic_auth GITHUB_USER, GITHUB_TOKEN

# Make API request
response = connection.get do |request|
  request.url GITHUB_URL
  request.options[:timeout] = 100
  request.headers['Content-Type'] = 'application/json'
  request.headers['Accept'] = 'application/vnd.github.inertia-preview+json'
end

# Parse JSON string reponse to JSON object
cards = JSON.parse response.body
# Compile tasks to screen
subject = "Weekly Status Report Ending #{Time.now.strftime("%m-%d-%Y")}"
message = "#{subject}\n"

# Take only the first line of each card and remove the circle emoji from the front of the text
cards.each do |card|
  note = card['note']
  note = note.gsub(/:.*_circle:/,'').gsub(/\r\n.*$/m,'').strip
  message << "- #{note}\n"
end

# Email the output to the receiver's email address
system("echo '#{message}' | mail -s '#{subject}' #{RECEIVER_EMAIL}")

