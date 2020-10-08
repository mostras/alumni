module CurrentExp
  extend ActiveSupport::Concern

  included do
    before_create :is_current
  end

  def is_current
    if self.end_time == "Aujourd'hui" || self.end_time == "Present" || self.current == true
      self.end_time = "Aujourd'hui"
      self.current = true
    end
  end
end
