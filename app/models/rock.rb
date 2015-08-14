class Rock < ActiveRecord::Base
    belongs_to :user
    has_many :rock_comments

    has_attached_file :image, styles: {thumbnail: "300x300"}
    validates_attachment_presence :image
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
    validates_attachment_size :image, in: 0.megabytes..5.megabytes

    validates_length_of :title, minimum: 1, maximum: 255, allow_blank: false
    validates_length_of :description, minimum: 1, maximum: 2000, allow_blank: false
end
