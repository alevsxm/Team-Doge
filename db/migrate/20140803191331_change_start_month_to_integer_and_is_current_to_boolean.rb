class ChangeStartMonthToIntegerAndIsCurrentToBoolean < ActiveRecord::Migration
  def change
    remove_column :positions, :is_current
    remove_column :positions, :start_month
  end
end
