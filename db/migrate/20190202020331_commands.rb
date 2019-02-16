class Commands < ActiveRecord::Migration[5.2]
  def change
    create_table :commands do |t|
      t.boolean :mizu
      t.boolean :hikari
      t.timestamps
    end
  end
end
