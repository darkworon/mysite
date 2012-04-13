class User < ActiveRecord::Base
  has_many :activations
  has_many :password_recovers
  has_many :uploads
  attr_accessor :password, :password_confirmation
  attr_accessible :email, :password, :password_confirmation, :firstname, :lastname, :password_digest, :city, :phone, :status
  validates_uniqueness_of :email, allow_blank: true
  validates_presence_of :email, :password, on: :create
  validates_format_of :email, with: /^([^@\s]+)@((?:[-a-z0-9]+.)+[a-z]{2,})$/i, allow_blank: true
  validates_length_of :password, minimum: 4, allow_blank: true
  validates_confirmation_of :password, allow_blank: true
  #validates :email, :password, :password_confirmation, :firstname, :lastname, :city, :phone, :presence => true
  
  #validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+.)+[a-z]{2,})$/i, :on => :creation
  
  def authenticate(unencrypted_password)
    if BCrypt::Password.new(password_digest) == unencrypted_password
      self
    else
      false
    end
  end
  
  def recover_authenticate
    unless password_recovers.first.nil?
      self
    else
      false
    end
  end

  def password=(unencrypted_password)
      @password = unencrypted_password
      unless unencrypted_password.blank?
        self.password_digest = BCrypt::Password.create(unencrypted_password)
      end
  end
  
  def name
    name = email
    unless firstname.blank?
      name = firstname
    end
    name
  end

  def full_name
    name = email
    unless firstname.blank?
      name = firstname
    end
    unless lastname.blank?
      name = lastname
    end
    unless firstname.blank? and lastname.blank?
      name = "#{firstname} #{lastname}"
    end
    
    name
  end
  
  def text_status
    if status == -1
      "Banned"
    elsif status == 0
      "Not Activated"
    elsif status == 1
      "User"
    elsif status == 2
      "Moderator"
    elsif status == 3
      "Administrator"
    end
  end
  
  
  def is_banned?
    return true if status == -1
    false
  end
  
  def is_activated?
    return false if status == 0
    true
  end
  
  def is_moderator?
    return true if status >= 2
    false
  end
  
  def is_admin?
    return true if status == 3
    false
  end
end
