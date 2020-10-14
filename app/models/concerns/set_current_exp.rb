module SetCurrentExp
  extend ActiveSupport::Concern

  def is_current
    if self.end_time == "Aujourd’hui" || self.end_time == "Aujourd'hui" || self.end_time == "Present" || self.current == true
      self.end_time = "Aujourd'hui"
      self.current = true
    end
  end


end
