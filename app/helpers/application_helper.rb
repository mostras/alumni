module ApplicationHelper
  def active_class_for(tab)
    string = "#{params[:controller]}-#{params[:action]}-#{tab}"

    case string
    when "users-index-alumni" then 'active'
    when "users-show-alumni" then 'active'
    when "companies-index-company" then 'active'
    when "companies-show-company" then 'active'
    when "schools-index-school" then 'active'
    when "schools-show-school" then 'active'
    when "admin/pages-statistics-statistics" then 'active'
    when "admin/pages-emails-emails" then 'active'
    end
  end

  def admins_only(&block)
    block.call if current_user.try(:admin?)
  end

  def non_admins_only(&block)
    block.call unless current_user.try(:admin?)
  end

end
