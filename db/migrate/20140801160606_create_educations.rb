class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.string(:school_name)
      t.string(:degree)
      t.integer(:start_year)
      t.integer(:end_year)
      t.references(:resovision)
      t.timestamps
    end
  end
end
