class UserDecorator < ApplicationDecorator
  delegate :username

  def link
    helpers.link_to name, object
  end

  def name
    object.username
  end
end
