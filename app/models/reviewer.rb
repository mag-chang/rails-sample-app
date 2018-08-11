class Reviewer < ApplicationRecord
    belongs_to :user
    has_many :reviews
    has_many :races,  through: :reviews
end
