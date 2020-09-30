module SchoolsFormHelper

  def school_list
    list = []
    schools = School.all
    schools.each do |school|
      list << [school.city.capitalize, school.city.downcase]
    end

    city_list = list.uniq
    return city_list
  end

end
