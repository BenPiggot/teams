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


  def destroy
    @team = Team.find(params[:id])
    @team.destroy
    redirect_to teams_path
  end


  def edit
    @team = Team.find(params[:id])
  end


  def update
  @team = Team.find(params[:id])
    if @team.update(team_params)
      redirect_to @team
    else
      render 'edit'
    end
  end


  private

  def team_params
    params.require(:team).permit(:name,:location,:stadium)
  end

end