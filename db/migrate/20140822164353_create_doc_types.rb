class CreateDocTypes < ActiveRecord::Migration
  def change
    create_table :doc_types do |t|
      t.string :description
      t.string :issuing_authority
      t.integer :area_id

      t.timestamps
    end
  end
end
