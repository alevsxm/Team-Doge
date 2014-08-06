class PositionsAddEndYearAndMonth < ActiveRecord::Migration
  def change
    add_column :positions, :end_year, :integer
    add_column :positions, :end_month, :integer
  end
end
