class TagsController < ApplicationController

  before_action :set_student, only: [:new, :create, :destroy]
  before_action :set_tag, only: [:edit, :destroy]

  def new
    @diplomas = Diploma.all
    @tag = @student.tags.build
  end

  def create
    @tag = @student.tags.build(tags_params)
    if @tag.save
      flash[:notice] = "Le tag a bien été ajouté."
      redirect_to new_user_tag_path(@student)
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
    @student = current_user
  end

  def tags_params
    params.require(:tag).permit(:diploma_id, :year)
  end
end
