module ApplicationHelper

  def admins_only(&block)
    block.call if current_user.try(:admin?)
  end

  def non_admins_only(&block)
    block.call unless current_user.try(:admin?)
  end

  def is_parsing?
    if current_user.automatic_updating && !current_user.manual_updating
      true
    elsif !current_user.automatic_updating && current_user.manual_updating
      false
    end
  end

  def active?(path)
   "active" if current_page?(path)
  end

end
