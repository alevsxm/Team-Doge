class RemoveLinkedinEmailAndPassword < ActiveRecord::Migration
  def change
    remove_column :users, :linkedin_email
    remove_column :users, :linkedin_pw
  end
end
