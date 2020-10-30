class RecruitmentsController < ApplicationController

  def index
    @recruitments = Recruitment.where(user: current_user)
    @recruitment = current_user.recruitments.build
    @companies = Company.includes(:work_experiences).where(work_experiences: { user: current_user, current: true })
  end

  def new

  end

  def create
    @recruitments = Recruitment.where(user: current_user)
    @companies = Company.includes(:work_experiences).where(work_experiences: { user: current_user, current: true })
    @recruitment = current_user.recruitments.build(recruitment_params)
    if @recruitment.save
      flash[:notice] = "Votre signalement a bien été pris en compte."
      redirect_to request.referrer
    else
      flash[:alert] = "Une erreur s'est produite. Veuillez recommencer."
      render :new
    end
  end

  def destroy
    @recruitment = Recruitment.find(params[:id])
    @recruitment.destroy
    redirect_to request.referrer
  end

  private

  def recruitment_params
    params.require(:recruitment).permit(:company_id)
  end

end
