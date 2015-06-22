class ModelCleanup < ActiveRecord::Migration
  def change
    drop_table :document_types

  end
end
