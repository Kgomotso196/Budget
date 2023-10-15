class AddNameToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :string, default: "", null: false
  end
end
