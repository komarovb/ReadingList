class RemoveRatingFromBooks < ActiveRecord::Migration
  def change
    remove_column :books, :raiting, :integer
  end
end
