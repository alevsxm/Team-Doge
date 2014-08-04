class UsersDeleteEndYearAndMonth < ActiveRecord::Migration
  def change
    remove_column :users, :end_year
    remove_column :users, :end_month
  end
end
