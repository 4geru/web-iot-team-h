class CreateCommands < ActiveRecord::Migration[5.2]
  def change
    create_table :commands do |t|
      t.boolean :mizu
      t.boolean :red_led
      t.boolean :green_led
      t.boolean :blue_led

      t.timestamps
    end
  end
end
