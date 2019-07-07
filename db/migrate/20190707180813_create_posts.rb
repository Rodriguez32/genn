class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :summary
      t.string :sector
      t.string :region
      t.string :type
      t.integer :user_id

      t.timestamps
    end
  end
end
