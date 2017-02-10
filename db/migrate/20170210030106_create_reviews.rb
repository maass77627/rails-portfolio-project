class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :summary
      t.text :body
      t.integer :rating
      t.integer :user_id
      t.integer :book_id
    end
  end
end
