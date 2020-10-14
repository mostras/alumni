module CustomValidations
  extend ActiveSupport::Concern

  def custom_start_time
    if self.start_time.present? && self.start_time !~ /(19|20)\d{2}/i
      errors.add(:start_time, "doit être un nombre à 4 chiffres")
    end
  end

  def custom_end_time
    unless self.current
      if self.end_time.present? && self.end_time !~ /(19|20)\d{2}/i
        errors.add(:end_time, "doit être un nombre à 4 chiffres")
      end
    end
  end
end
