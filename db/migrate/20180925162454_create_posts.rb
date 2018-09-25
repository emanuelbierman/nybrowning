class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :content
      t.timestamps null: false
      # this creates: t.datetime :created_at and :updated_at
    end
  end
end
