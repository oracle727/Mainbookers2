class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.integer :follows_id,null: false
      t.integer :followers_id,null: false

      t.timestamps
    end
  end
end
