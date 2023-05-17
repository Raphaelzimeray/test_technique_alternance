class TournamentsController < ApplicationController
  before_action :set_tournament, only: [:show, :edit, :update, :destroy]

  def index
    @tournaments = Tournament.all
  end

  def create
    @tournament = Tournament.new

    if @tournament.save
      generate_teams_and_matches
      redirect_to @tournament, notice: 'Tournoi créé avec succès.'
    else
      render :new, notice: 'Erreur lors de la création du tournoi.', status: :unprocessable_entity
    end
  end

  def generate_teams_and_matches
    8.times do
      team = Team.create!(name: Faker::Team.name)
      8.times do
        team.players.create!(name: Faker::Name.name, role:["Heal", "Tank", "DPS"].sample)
      end
    end

    teams = Team.last(8)
    teams.combination(2).to_a.each do |team1, team2|
      @tournament.matches.create!(team_one: team1, team_two: team2, team_one_score: rand(0..3), team_two_score: rand(0..3))
    end
  end

  def generate_ranking
    teams = self.teams
    ranking = {}

    teams.each do |team|
      ranking[team.id] = matches.where("team1_id = ? OR team2_id = ?", team.id, team.id).sum do |match|
        if match.team1_id == team.id
          match.score1
        else
          match.score2
        end
      end
    end

    ranking.sort_by { |_, score| score }.reverse.to_h
  end

  def show
  end

  def new
    @tournament = Tournament.new
  end

  def edit
  end

  def update
    if @tournament.update(tournament_params)
      redirect_to @tournament, notice: 'Tournoi mis à jour avec succès.'
    else
      render :edit
    end
  end

  def destroy
    @tournament.destroy
    redirect_to tournaments_url, notice: 'Tournoi supprimé avec succès.'
  end

  private
    def set_tournament
      @tournament = Tournament.find(params[:id])
    end
end
