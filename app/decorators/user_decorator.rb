class UserDecorator < ApplicationDecorator
  delegate :username

  def author_link
    helpers.link_to author_name, object.user
  end

  def author_name
    object.username
  end
end
