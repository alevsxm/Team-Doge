class Position < ActiveRecord::Base
  belongs_to :resovision
  has_one :video
end