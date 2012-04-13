class AddFileTypeToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :file_type, :integer, default: 0

  end
end
