module ListsHelper

  def email_list(list)

    email_string = ""
    users = list.users

    users.each do |user|
      email_string << "#{user.email},"
    end

    email_string_without_last = email_string.chop

    return "mailto:" + email_string_without_last
  end
end
