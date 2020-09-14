class TagsController < ApplicationController

  before_action :set_student, only: [:create, :remove_tags]
  before_action :set_tag, only: [:edit, :destroy]

  def create
    @tag = @student.tags.build(tags_params)
    if @tag.save
      flash[:notice] = "Le tag a bien été ajouté."
      redirect_to edit_user_path(@student)
    else
      flash[:alert] = "Le tag n'a pas pu être ajouté."
      render :new
    end
  end

  def destroy
    @tag.destroy
  end


  private

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def set_student
    @student = User.find(params[:user_id])
  end

  def tags_params
    params.require(:tag).permit(:diploma_id, :year)
  end
end
