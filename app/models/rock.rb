class Rock < ActiveRecord::Base
    belongs_to :user
    has_many :rock_comments

    has_attached_file :image, styles: {thumbnail: "300x300"}
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
