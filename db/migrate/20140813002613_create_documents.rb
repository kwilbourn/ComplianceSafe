class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :name
      t.string :permit_number
      t.date :expiration_date
      t.datetime :created
      t.datetime :modified
      t.integer :type_ID
      t.integer :user_ID

      t.timestamps
    end
  end
end
