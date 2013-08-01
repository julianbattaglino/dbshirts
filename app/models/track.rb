class Track < ActiveRecord::Base
  attr_accessible :day, :ip, :trackable_id, :trackable_type, :views
  belongs_to :trackable, polymorphic: true

end
