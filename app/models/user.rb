class User < ActiveRecord::Base

  attr_accessor :remember_me

  has_many :blogs, :order=>"created_at DESC"
  has_many :albums

  USER_ID_MIN_LENGTH = 4
  USER_ID_MAX_LENGTH = 20
  PASSWORD_MIN_LENGTH = 4
  PASSWORD_MAX_LENGTH = 40
  EMAIL_MAX_LENGTH = 50
  
  USER_ID_RANGE = USER_ID_MIN_LENGTH..USER_ID_MAX_LENGTH
  PASSWORD_RANGE = PASSWORD_MIN_LENGTH..PASSWORD_MAX_LENGTH
  
  validates_length_of :password, :within => PASSWORD_RANGE
  validates_length_of :user_id, :within => USER_ID_RANGE
  validates_length_of :password, :within => PASSWORD_RANGE
  validates_length_of :email, :maximum => EMAIL_MAX_LENGTH


  validates_presence_of :first_name, :last_name, :user_id, :password, :email, :phone
  validates_uniqueness_of :user_id, :email
  #validates_length_of :phone, :within=>10....15
  
  def validate
    errors.add(:email, "must be valid.") unless email.include?("@")
    if user_id.include?(" ")
      errors.add(:user_id, "cannot include spaces.")
    end
  end

  validates_format_of :email,
    :with => /^[A-Z0-9._%-]+@([A-Z0-9-]+\.)+[A-Z]{2,4}$/i,
    :message => "must be a valid email address"
    

end
