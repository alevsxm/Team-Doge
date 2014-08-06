class Video < ActiveRecord::Base
  belongs_to :resovision
  belongs_to :position
  belongs_to :education
end
