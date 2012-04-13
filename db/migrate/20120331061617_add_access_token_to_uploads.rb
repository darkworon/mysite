class AddAccessTokenToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :access_token, :string

  end
end
