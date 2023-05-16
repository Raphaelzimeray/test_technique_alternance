class TeamsController < ApplicationController


  def generate
    8.times do |i|
      team = Team.create(name: "Team #{i + 1}", city: "City #{i + 1}")
      11.times do |j|
        team.players.create(name: "Player #{j + 1}", role: ['Heal', 'Tank', 'DPS'].sample)
      end
    end
    redirect_to teams_path, notice: '8 teams with 11 players each have been generated.'
  end
end
