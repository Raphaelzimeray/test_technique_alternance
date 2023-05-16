class TeamsController < ApplicationController


  def index
    @team = Team.all
  end

  def show
    @team = Team.find(params[:id])
  end


  def new
    @team = Team.new
  end

  def create
    @team = Team.create(teams_params)
      if @team.save
        redirect_to  reparation_path(@team)
      else
        render :new
      end
  end

  def generate
    8.times do |i|
      team = Team.create(name: "Team #{i + 1}", city: "City #{i + 1}")
      11.times do |j|
        team.players.create(name: "Player #{j + 1}", role: ['Heal', 'Tank', 'DPS'].sample)
      end
    end
    redirect_to teams_path, notice: '8 teams with 11 players each have been generated.'
  end

  private 

  def teams_params
    params.require(:teams).permit(:name, :city)
  end
end
