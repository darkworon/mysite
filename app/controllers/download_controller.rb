class DownloadController < ApplicationController
  skip_before_filter :authorize
  def getfile
    upload = Upload.where(access_token: params[:link], file_type: 0).first
    send_file upload.file.path, filename: upload.file_file_name, type: upload.file_content_type, streaming: true
  end
  
  def view
    upload = Upload.where(access_token: params[:link], file_type: 1).first
    unless upload.nil?
      if params[:style]
        send_file upload.file.path(params[:style]), filename: upload.file_file_name, type: upload.file_content_type, disposition: "inline"
      else
        send_file upload.file.path, filename: upload.file_file_name, type: upload.file_content_type, disposition: "inline"
      end
    else
      render :text => "404", :status => :not_found
    end
  end
end
