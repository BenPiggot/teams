class TeamsController < ApplicationController

  def index
    @teams = Team.all
  end


  def new
    @team = Team.new
    @tags = Tag.all
  end


  def create
    @team = Team.create(team_params)
    params[:team][:tag_ids].each do |tag|
    @team.tags << Tag.find(tag) unless tag.blank?
  end
    redirect_to teams_path
  end


  def show
    @team = Team.find(params[:id])
    @tags = @team.tags
  end


  def destroy
    @team = Team.find(params[:id])
    @team.destroy
    redirect_to teams_path
  end


  def edit
    @team = Team.find(params[:id])
    @tags = Tag.all
  end


  def update
  @team = Team.find(params[:id])
    @team.update(team_params)
    @team.tags.clear
    params[:team][:tag_ids].each do |tag|
    @team.tags << Tag.find(tag) unless tag.blank?
    end
      redirect_to @team
  end


  private

  def team_params
    params.require(:team).permit(:name,:location,:stadium)
  end

  def tag_params
    params.require(:tags).permit(:names, :ids)
  end

end