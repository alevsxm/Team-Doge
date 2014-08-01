class CreateResovisions < ActiveRecord::Migration
  def change
    create_table :resovisions do |t|
      t.string(:linkedin_id)
      t.string(:first_name)
      t.string(:last_name)
      t.string(:headline)
      t.string(:location)
      t.string(:industry)
      t.int




    end
  end
end
