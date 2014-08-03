class PositionsEndYearAndEndMonth < ActiveRecord::Migration
  def change
    add_column :users, :end_year, :integer
    add_column :users, :end_month, :integer
  end
end
