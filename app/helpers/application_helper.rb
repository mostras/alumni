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

  def put_alert_on_top
    if current_page?(root_path) || current_page?(new_user_registration_path) || current_page?(linkedin_path) || current_page?(tag_creation_tags_path) || current_page?(sector_creation_user_sectors_path) || current_page?(welcome_path) || current_page?(new_user_session_path)
      return 'alert-on-top'
    end
  end
end
