class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name, linit: 100, null: false
      t.text :description, limit: 4_000
      t.datetime :start_time, null: false
      t.text :recurring
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
