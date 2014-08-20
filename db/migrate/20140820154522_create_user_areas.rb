class CreateUserAreas < ActiveRecord::Migration
  def change
    create_table :user_areas do |t|
      t.belongs_to :user
      t.belongs_to :area
      t.timestamps
    end
  end
end
