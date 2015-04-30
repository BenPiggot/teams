class TagsController < ApplicationController

  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def show
    @tag = Tag.find(params[:id])
    @teams = @tag.teams
  end

  def create
    @tag = Tag.create(tag_params)
    redirect_to tags_path
  end

  def destroy
    @tag = Tag.find(params[:id])
    if @tag.teams.length > 0
      if @tag.teams.length == 1
        flash[:danger] = "This tag is currently being used by #{@tag.teams.length} team and cannot be deleted"
        redirect_to tags_path
      else
        flash[:danger] = "This tag is currently being used by #{@tag.teams.length} teams and cannot be deleted"
        redirect_to tags_path
      end
    else
      @tag.destroy
      redirect_to tags_path
    end

  end


private

  def tag_params
    params.require(:tag).permit(:name)
  end

end