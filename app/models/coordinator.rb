class Coordinator < ApplicationRecord
    has_many :registry
    has_many :participant
end