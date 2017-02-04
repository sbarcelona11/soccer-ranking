require_relative "soccer_league"

class FindTeamsAndScores

  def initialize (read_file)
    @soccer = []
    @teams = []
    while line = read_file.gets
      fields = line.split(/[,\s]+/)

      if (fields[2].include?("FC"))
        fields[2] = fields[2] +" "+ fields[3]
        fields[3] = fields[4]
      end

      team_1 = fields[0]
      result_1 = fields[1]
      team_2 = fields[2]
      result_2 = fields[3]

      @soccer << SoccerLeague.new(team_1, result_1, team_2, result_2)
    end
  end

  def find_teams_points
    @soccer.each do |f|
      points = 0
      if (f.result_1.to_i > f.result_2.to_i)
        points = 3
        @teams << [f.team_1, points]
        @teams << [f.team_2, 0]
      elsif (f.result_1.to_i < f.result_2.to_i)
        points = 3
        @teams << [f.team_2, points]
        @teams << [f.team_1, 0]
      else
        points = 1
        @teams << [f.team_1, points]
        @teams << [f.team_2, points]
      end
    end
    create_points_hash
  end

  def create_points_hash
    tableData = {}
    @teams.each_with_index do |data, i|
      currentTeam = data[0]
      currentScore = data[1]
      existingScore = 0
      if (tableData.has_key?(currentTeam))
        existingScore = tableData[currentTeam]
      end
      tableData[currentTeam] = existingScore + currentScore
    end
    tableData.sort_by { |k, v| v }.reverse
  end

end