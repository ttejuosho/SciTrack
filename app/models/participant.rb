class Participant < ApplicationRecord
    has_one :coordinator
    has_many :registry
end