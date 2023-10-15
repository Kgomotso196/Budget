class CreateGroupsEntities < ActiveRecord::Migration[7.1]
  def change
    create_table :groups_entities do |t|
      t.references :group, null: false, foreign_key:  { to_table: :groups }
      t.references :entity, null: false, foreign_key:  { to_table: :entities }

      t.timestamps
    end
  end
end
