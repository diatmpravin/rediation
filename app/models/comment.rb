class Comment < ActiveRecord::Base

    belongs_to :blog
  
    validates_presence_of :name, :body
    validates_uniqueness_of  :body


end
