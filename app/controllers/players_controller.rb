class PlayersController < ApplicationController


  def index
    @players = Player.all
  end

  def show
    @player = Player.find(params[:id])
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.create(player_params)
    if @player.save
      redirect_to  player_path(@player)
    else
      render :new
    end
  end


  private

  def player_params
    params.require(:player).permit(:name, :team, :role)
  end

end
