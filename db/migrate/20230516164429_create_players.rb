class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.string :name
      t.string :role
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
