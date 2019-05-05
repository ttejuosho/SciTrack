class Participant < ApplicationRecord
    has_one :coordinator
    has_one :registry
end