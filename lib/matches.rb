# frozen_string_literal: true

class Matches
  # attr_accessor :first_team
  def initialize
    @matches = []
    @teams = []
  end

  def add_match(match_in_list)
    @matches << match_in_list
  end

  def add_team(team_in_list)
    @teams << team_in_list
  end

  def sort_teams_by_name
    arr = @teams.sort.uniq
    return arr.each unless block_given?

    arr.each do |t|
      yield t
    end
  end

  def sort_teams_by_points
    arr = Hash.new(0)
    @matches.each do |match|
      arr[match.first_team] += match.points_of_first_team
      arr[match.second_team] += match.points_of_second_team
    end
    arr = arr.sort { |a, b| a[1] <=> b[1] }
    return arr.each unless block_given?

    arr.each do |t|
      yield t[0]
    end
  end

  def remove_depend_block
    arr = @matches
    arr.each do |m|
      @matches.delete(m) if yield m
    end
  end

  def list_matches
    arr = @matches
    arr.each do |match|
      yield match
    end
  end
end
