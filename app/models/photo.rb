class Photo < ApplicationRecord
  #Mounts paperclip image
has_attached_file :image, :styles => { :large => "900>", :medium => width = "300>", :thumb => "100>" }

# validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
