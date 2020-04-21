# frozen_string_literal: true

class Match_Rez
  attr_accessor :first_team
  attr_accessor :second_team
  attr_accessor :points_of_first_team
  attr_accessor :points_of_second_team
  def initialize(first_team, second_team, points_of_first_team, points_of_second_team)
    @first_team = first_team
    @second_team = second_team
    @points_of_first_team = points_of_first_team
    @points_of_second_team = points_of_second_team
  end
    end
