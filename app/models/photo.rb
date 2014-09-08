class Photo < ActiveRecord::Base
  has_attached_file :image, :styles => { :large => "700x700", :medium => "500x500", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  has_many :tags
  has_many :users, through: :tags

end
