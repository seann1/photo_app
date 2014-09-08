class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.column :photo_id, :integer
      t.column :user_id, :integer
      t.timestamps
    end
  end
end
