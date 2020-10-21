module StudentCardsHelper
  def last_activity(student)

    # #True = work / False = school

    # if student.work_experiences.any? && student.school_experiences.empty?
    #   #If there is no school experiences
    #   return true
    # elsif student.work_experiences.empty? && student.school_experiences.any?
    #   #If there is no work experiences
    #   return false
    # elsif student.work_experiences.any? && student.school_experiences.any?
    #   #If there is work and school experiences
    #   last_work_experience = student.work_experiences.order(:end_time).last
    #   last_school_experience = student.school_experiences.order(:end_time).last

    #   if last_work_experience.try(:end_time) === "Aujourd'hui" && last_school_experience.try(:end_time) === "Aujourd'hui"
    #     #If the work and school experiences are actual
    #     return true
    #   elsif last_work_experience.try(:end_time) === "Aujourd'hui" && !last_school_experience.try(:end_time) === "Aujourd'hui"
    #     #If the job work experiences is actual
    #     return true
    #   elsif !last_work_experience.try(:end_time) === "Aujourd'hui" && last_school_experience.try(:end_time) === "Aujourd'hui"
    #     #If the school experiences is actual
    #     return false
    #   elsif last_work_experience.try(:end_time).to_i === last_school_experience.try(:end_time).to_i
    #     #If the work and school experiences end at the same date
    #     return true
    #   elsif last_work_experience.try(:end_time).to_i >= last_school_experience.try(:end_time).to_i
    #     #If the work experience end after the school experiences
    #     return true
    #   elsif last_work_experience.try(:end_time).to_i <= last_school_experience.try(:end_time).to_i
    #     #If the school experience en after the work experiences
    #     return false
    #   end
    # end
    # if student.work_experiences.any? || student.school_experiences.any?
    #   work_exp = student.work_experiences if student.work_experiences.any?
    #   school_exp = student.school_experiences if student.school_experiences.any?
    #   total_exp = work_exp + school_exp
    #   total_exp.order(:endtime, :start_time)
    #   binding.pry


    # end

  end

  def is_looking_for?(student)
    return 'hire' if params[:controller] == 'companies' && params[:action] == 'show' && student.company_hire?

    if student.looking_for_job?
      return 'job'
    elsif student.looking_for_internship?
      return 'internship'
    elsif student.company_hire?
      return 'hire'
    end
  end
end







