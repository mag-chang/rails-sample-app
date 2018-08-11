class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :reviewer, foreign_key: true
      t.references :race, foreign_key: true
      t.integer :score
      t.text :content

      t.timestamps
    end
  end
end
