class Resovision < ActiveRecord::Base
  belongs_to :user
  has_many :positions, dependent: :destroy
  has_many :educations, dependent: :destroy
  has_one :video, dependent: :destroy 
end
