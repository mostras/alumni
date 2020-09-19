class TagsController < ApplicationController

  before_action :set_student, only: [:index, :new, :create, :edit]
  before_action :set_tag, only: [:edit, :destroy]

  def index
    @tags = Tag.where(user: current_user)
    @tag = @student.tags.build
    @diplomas = Diploma.all
  end

  def new
    @diplomas = Diploma.all
    @tag = @student.tags.build
  end

  def create
    @tag = @student.tags.build(tags_params)
    if @tag.save
      flash[:notice] = "Le tag a bien été ajouté."
      redirect_to request.referrer
    else
      flash[:alert] = "Le tag n'a pas pu être ajouté."
      render :new
    end
  end

  def edit
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
