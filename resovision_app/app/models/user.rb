class User < ActiveRecord::Base
  has_one :resovision, dependent: :destroy

  def self.create_user(response_hash)
    linkedin_member_id = response_hash["id"]
    User.create!(linkedin_member_id: linkedin_member_id)
  end

end
