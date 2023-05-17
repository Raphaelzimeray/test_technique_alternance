class PlayersController < ApplicationController
  before_action :set_team
  before_action :set_player, only: [:show, :edit, :update, :destroy]

  def index
    @players = @team.players
  end

  def show
  end

  def new
    @player = @team.players.build
  end

  def create
    @player = @team.players.build(player_params)
    if @player.save
      redirect_to [@team, @player], notice: 'Joueur créé.'
    else
      flash.now[:alert] = @player.errors.full_messages.join(', ')
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @player.update(player_params)
      redirect_to [@team, @player], notice: 'Player was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @player.destroy
    redirect_to team_players_url(@team), notice: 'Player was successfully destroyed.'
  end

  private

  def set_team
    @team = Team.find(params[:team_id])
  end

  def set_player
    @player = @team.players.find(params[:id])
  end

  def player_params
    params.require(:player).permit(:name, :role)
  end
end
