class AddLastSeenToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :last_seem_at, :datetime
  end
end
