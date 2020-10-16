module ListsHelper

  def email_list(list)
    email_string = ""
    users = list.users

    users.each do |user|
      email_string << "#{user.email},"
    end

    email_string_without_last_c = email_string.chop

    return "mailto:" + email_string_without_last_c
  end
end
