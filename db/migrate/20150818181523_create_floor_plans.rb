class CreateFloorPlans < ActiveRecord::Migration
  def change
    create_table :floor_plans do |t|
      t.integer :user_id
      t.string :title
      t.string :image

      t.timestamps null: false
    end
  end
end
