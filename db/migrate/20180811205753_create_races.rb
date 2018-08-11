class CreateRaces < ActiveRecord::Migration[5.2]
  def change
    create_table :races do |t|
      t.string :name
      t.date :started_on

      t.timestamps
    end
  end
end
