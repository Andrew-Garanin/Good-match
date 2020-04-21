# frozen_string_literal: true

require 'csv'
require_relative 'match_rez'
require_relative 'matches'

# Add match on array from csv file
class MatchesReader
  def read_matches(filename)
    matches = Matches.new
    CSV.foreach(filename, headers: true) do |row|
      matches.add_match(Match_Rez.new(
                          row['FIRST_TEAM'].strip,
                          row['SECOND_TEAM'].strip, Integer(row['POINTS_OF_FIRST_TEAM']), Integer(row['POINTS_OF_SECOND_TEAM'])
                        ))
      matches.add_team(row['FIRST_TEAM'].strip)
      matches.add_team(row['SECOND_TEAM'].strip)
    end
    matches
    # pp matches
  end
end
