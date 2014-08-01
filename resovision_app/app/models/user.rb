class User < ActiveRecord::Base
  has_one :resovision, dependent: :destroy
end
