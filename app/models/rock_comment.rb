class RockComment < ActiveRecord::Base
    belongs_to :user
    belongs_to :rock

    validates_length_of :text, minimum: 1, maximum: 2000, allow_blank: false
end
