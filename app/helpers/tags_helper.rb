module TagsHelper
  def last_activity(student)

    last_work_experience = student.work_experiences.order(:end_time).last if student.work_experiences.any?

    last_school_experience = student.school_experiences.order(:end_time).last if student.school_experiences.any?

    if last_work_experience || last_school_experience
      if last_work_experience.try(:end_time) === "Aujourd'hui" && last_school_experience.try(:end_time) === "Aujourd'hui"
        false
      elsif last_work_experience.try(:end_time) === "Aujourd'hui" && !last_school_experience.try(:end_time) === "Aujourd'hui"
        true
      elsif !last_work_experience.try(:end_time) === "Aujourd'hui" && last_school_experience.try(:end_time) === "Aujourd'hui"
        false
      elsif last_work_experience.try(:end_time).to_i === last_school_experience.try(:end_time).to_i
        true
      elsif last_work_experience.try(:end_time).to_i >= last_school_experience.try(:end_time).to_i
        true
      elsif last_work_experience.try(:end_time).to_i <= last_school_experience.try(:end_time).to_i
        false
      end
    end
  end

end

#True = work / False = school





