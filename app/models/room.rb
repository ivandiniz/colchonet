class Room < ActiveRecord::Base
  validates_presence_of :title,  :location
  def complete_name
    "#{title}, #{location}"
  end
end
