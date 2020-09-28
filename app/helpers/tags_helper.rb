module TagsHelper
  def last_activity(student)
    if student.work_experiences.any?
      last_work_experience = student.work_experiences.order(:end_time).last
    end

    if student.school_experiences.any?
      last_school_experience = student.school_experiences.order(:end_time).last
    end

    if last_work_experience && last_school_experience
      if last_work_experience.end_time.to_i >= last_school_experience.end_time.to_i
        last_work_experience.company.name
      elsif last_work_experience.end_time.to_i <= last_school_experience.end_time.to_i
        last_work_experience.school.name
      end
    end


  end
end
