class TeamsController < ApplicationController

  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.create(team_params)
    redirect_to @team
  end

  def show
    @team = Team.find(params[:id])
  end

  def delete
    @team = Team.destroy(params[:id])
  end

  private

  def team_params
    params.require(:team).permit(:name,:location,:stadium)
  end

end