class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end


  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to @team, notice: 'Equipe créée.'
    else
      render 'new'
    end
  end

  def show
    @team = Team.find(params[:id])
  end

  private

  def team_params
    params.require(:team).permit(:name, :city)
  end
end
