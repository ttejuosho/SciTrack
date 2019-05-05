class Registry < ApplicationRecord
    has_many :coordinator
    has_many :participant
end