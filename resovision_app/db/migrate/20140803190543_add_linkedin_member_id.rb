class AddLinkedinMemberId < ActiveRecord::Migration
  def change
    add_column :users, :linkedin_member_id, :string
  end
end
