# encoding: utf-8
class Upload < ActiveRecord::Base
  belongs_to :user
  before_create :set_file_type
  before_create :generate_access_token
  
  GIGA_SIZE = 1073741824.0
  MEGA_SIZE = 1048576.0
  KILO_SIZE = 1024.0
  
  validates_attachment_presence :file
  has_attached_file :file,
                     :styles => { :medium => "300x300>", :thumb => "100x100>" },
                     :path => ':rails_root/uploads/files/:access_token/:style/:filename'
  #validates_attachment :file, presence: true
  before_post_process :skip_not_image
  
  

  
  def size
    precision = 2
     case
       when file_file_size == 1 then "1 Б"
       when file_file_size < KILO_SIZE then "%d Б" % file_file_size
       when file_file_size < MEGA_SIZE then "%.#{precision}f КБ" % (file_file_size / KILO_SIZE)
       when file_file_size < GIGA_SIZE then "%.#{precision}f МБ" % (file_file_size / MEGA_SIZE)
       else "%.#{precision}f ГБ" % (file_file_size / GIGA_SIZE)
     end
   end
  private

  # SHA1 from random salt and time
  def generate_access_token
    self.access_token = Digest::SHA1.hexdigest("#{random_salt}#{Time.now.to_i}")
  end


  
  def skip_not_image
    if %w(image/jpeg image/png image/gif).include?(file_content_type)
      self.file_type = 1
    #  self.save
      return true
    else
      return false
    end
  end
  # simple random salt
  def random_salt(len = 20)
    chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
    salt = ""
    1.upto(len) { |i| salt << chars[rand(chars.size-1)] }
    return salt
  end
  
  def set_file_type
    if %w(image/jpeg image/png image/gif).include?(file_content_type)
      self.file_type = 1
    end
  end
  
  # interpolate in paperclip
  Paperclip.interpolates :access_token  do |attachment, style|
    attachment.instance.access_token
  end
end
