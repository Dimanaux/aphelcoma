class DateDecorator < ApplicationDecorator
  def to_s
    object.strftime "%F %H:%M"
  end
end
