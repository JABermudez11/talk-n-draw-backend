class CreatePendings < ActiveRecord::Migration[6.0]
  def change
    create_table :pendings do |t|
      t.integer :owner_id
      t.integer :friend_id

      t.timestamps
    end
  end
end
