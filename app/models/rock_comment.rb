class RockComment < ActiveRecord::Base
    belongs_to :user
    belongs_to :rock
end
