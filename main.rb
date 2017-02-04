require_relative "class/find_scores"
require_relative "class/soccer_league"

print "Input file name: "

file = gets.chomp

if file.nil? or file.empty?
  file = 'files/sample-input.txt'
end

if !file.include?('.txt') || file.is_a?(Integer)
  puts "Bad input file name"
  exit
end

read_file = File.open(file, "r")
write_file = File.open("files/output.txt", 'w')

teams_and_scores = FindTeamsAndScores.new(read_file)

hash_points = teams_and_scores.find_teams_points

hash_points.each_with_index do |f, index|
  text = f[1] == 1 ? "pt" : "pts"
  print "#{index+1}. #{f[0]}, #{f[1]} #{text} "
  puts

  write_file.puts "#{index+1}. #{f[0]}, #{f[1]} #{text} "

end
