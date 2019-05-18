class Registry < ApplicationRecord
    has_many :coordinators
    has_many :participants, :through => :coordinators
end