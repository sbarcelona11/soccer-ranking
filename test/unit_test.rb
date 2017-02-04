require "minitest/autorun"
require_relative "../class/find_scores"
require_relative "../class/soccer_league"

class UnitTest < Minitest::Test
  def setup
    @team1 = FindTeamsAndScores.new(File.open("sample-input-test.txt", "r"))
    @team2 = FindTeamsAndScores.new(File.open("sample-input-test-2.txt", "r"))
  end

  def test_first_test
    assert_equal [["Tarantulas", 6], ["Lions", 5], ["Snakes", 1], ["FC Awesome", 1], ["Grouches", 0]], @team1.find_teams_points
  end

  def test_second_test
    assert_equal [["Tarantulas", 6], ["Lions", 5], ["FC Awesome", 1], ["Snakes", 1], ["Grouches", 0]], @team2.find_teams_points
  end
end