#Fetch the votes

require 'date'
require_relative '../models'
require_relative '../parsers/votes'

latest_vote = Vote.all(:order => [ :created_at.desc ]).first

fetch_time = latest_vote ? latest_vote.created_at : DateTime.new - 1
fetch_time = DateTime.new(ARGV[0]) if ARGV[0]

if VoteParser.fetch_since fetch_time
  puts "Parsed some votes"
else
  puts "Did not find any new votes"
end


