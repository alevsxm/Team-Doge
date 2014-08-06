class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string(:title)
      t.string(:summary)
      t.integer(:start_year)
      t.integer(:start_month)
      t.string(:is_current)
      t.string(:company_name)
      t.references(:resovision)
      t.timestamps
    end
  end
end
