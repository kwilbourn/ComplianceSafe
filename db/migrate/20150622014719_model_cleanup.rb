class ModelCleanup < ActiveRecord::Migration
  def change
    delete_table :document_types
  end
end
