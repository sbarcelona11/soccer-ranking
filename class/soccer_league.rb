class SoccerLeague
  attr_accessor :team_1, :result_1, :team_2, :result_2

  def initialize(team_1, result_1, team_2, result_2)
    @team_1 = team_1
    @result_1 = result_1
    @team_2 = team_2
    @result_2 = result_2
  end

  def to_s
    return "%s %s %s %s" %
        [@team_1, @result_1, @team_2, @result_2]
  end
end