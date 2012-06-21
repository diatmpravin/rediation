class Album < ActiveRecord::Base

    has_many :photos
    accepts_nested_attributes_for :photos, :allow_destroy => true

    validates_presence_of :name, :description

end
