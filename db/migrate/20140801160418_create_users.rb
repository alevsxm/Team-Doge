class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string(:linkedin_email)
      t.string(:linkedin_pw)
      t.timestamps
    end
  end
end
