class ChangeStartMonthToIntegerAndIsCurrentToBoolean2 < ActiveRecord::Migration
  def change
    add_column :positions, :is_current, :boolean
    add_column :positions, :start_month, :integer
  end
end
