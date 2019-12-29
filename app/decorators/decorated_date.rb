class DecoratedDate < ApplicationDecorator
  def to_s
    object.created_at.strftime "%F %H:%M"
  end
end
