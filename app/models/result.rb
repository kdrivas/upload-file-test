class Result < ApplicationRecord

  has_attached_file :file, :path => ":rails_root/results/:class/:id/:basename.:extension",
      :url => "/documents/:id/download"
    validates_attachment_presence :file

  validates_attachment_content_type :file, :content_type => ["application/pdf","application/vnd.ms-excel",     
             "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
             "application/msword", 
             "application/vnd.openxmlformats-officedocument.wordprocessingml.document", 
             "text/plain","image/jpg", "image/png"]

end
