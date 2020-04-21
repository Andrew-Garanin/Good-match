# frozen_string_literal: true

require 'tty-prompt'
require_relative '../lib/matches_reader'

def main
  p = MatchesReader.new
  matches = p.read_matches(File.expand_path('../data/2019-ti-group-stage.csv', __dir__))
  table(matches)
  # matches.sort_teams_by_name{|t| puts t}
  # pp "====="
  # matches.sort_teams_by_points{|t| puts t}
  # pp "===="
  # matches.remove_depend_block{|m|  m.first_team=="Newbee"}
end

def table(matches)
  print '              '
  matches.sort_teams_by_name { |t| print "     #{t}" }

  matches.sort_teams_by_name do |t1|
    print "\n\n#{t1}"
    (19 - t1.size).times do
      print ' '
    end
    matches.sort_teams_by_name do |t2|
      matches.list_matches do |m|
        if (m.first_team == t1) && (m.second_team == t2)
          print "#{m.points_of_first_team}/#{m.points_of_second_team}"
          Integer(5 + t2.size - 3).times do
            print ' '
          end
          break
        end
        if (m.first_team == t2) && (m.second_team == t1)
          print "#{m.points_of_second_team}/#{m.points_of_first_team}"
          Integer(5 + t2.size - 3).times do
            print ' '
          end
          break
        end
        if t1 == t2
          Integer(5 + t2.size).times do
            print ' '
          end
          break
        end
      end
    end
  end
end

main if __FILE__ == $PROGRAM_NAME
