class AddIsReviewerToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :is_reviewer, :boolean, null: false, default: false
  end
end
