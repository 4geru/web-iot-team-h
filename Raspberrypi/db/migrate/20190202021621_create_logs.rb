class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.bigint :tanbo_id
      t.decimal :shitsudo
      t.decimal :oto
      t.decimal :ondo
      t.decimal :camera
      t.datetime :loged_at

      t.timestamps
    end
  end
end
