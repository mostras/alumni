module StudentCardsHelper
  def last_activity(student)
    current_work_exp = student.work_experiences.where(current: true)
    current_school_exp = student.school_experiences.where(current: true)
    work_exp_sort = student.work_experiences.order(:end_time)
    school_exp_sort = student.school_experiences.order(:end_time)


    if student.work_experiences.any? && student.school_experiences.any?
      if current_work_exp.any?
        exp = current_work_exp.order(:start_time).last
        return [true, exp.company.name]
      elsif current_school_exp.any?
        exp = current_school_exp.order(:start_time).last
        return [false, exp.school.name]
      elsif work_exp_sort.last.end_time == school_exp_sort.last.end_time
        exp = work_exp_sort.last
        return [true, exp.company.name]
      elsif work_exp_sort.last.end_time > school_exp_sort.last.end_time
        exp = work_exp_sort.last
        return [true, exp.company.name]
      else
        exp = school_exp_sort.last
        return [false, exp.school.name]
      end
    elsif student.work_experiences.any? && student.school_experiences.empty?
      if current_work_exp.any?
        exp = current_work_exp.order(:start_time).last
        return [true, exp.company.name]
      else
        exp = work_exp_sort.last
        return [true, exp.company.name]
      end
    elsif student.work_experiences.empty? && student.school_experiences.any?
      if current_school_exp.any?
        exp = current_school_exp.order(:start_time).last
        return [false, exp.school.name]
      else
        exp = school_exp_sort.last
        return [false, exp.school.name]
      end
    else
      return ''
    end

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







