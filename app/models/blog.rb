class Blog < ActiveRecord::Base

  belongs_to :user
  has_many :comments
  #attr_accessor :user_id 
  validates_presence_of :title, :body

end
