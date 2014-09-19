class AddSampleFileToDocTypes < ActiveRecord::Migration
    def self.up
    change_table :doc_types do |t|
      t.attachment :sample_file
    end
  end

  def self.down
    remove_attachment :doc_types, :sample_file
  end
end
