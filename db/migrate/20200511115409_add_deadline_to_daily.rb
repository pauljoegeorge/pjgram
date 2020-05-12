class AddDeadlineToDaily < ActiveRecord::Migration[6.0]
  def up
    add_column :dailies, :deadline, :datetime
  end

  def down
    remove_column :dailies, :deadline, :datetime
  end
end
