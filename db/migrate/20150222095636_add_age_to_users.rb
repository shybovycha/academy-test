class AddAgeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :age, :integer, default: 1, null: false
  end
end
