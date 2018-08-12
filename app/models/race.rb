class Race < ApplicationRecord
    has_many :reviews
    has_many :reviewers, through: :reviews
end
