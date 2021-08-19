class Movie < ApplicationRecord
    has_many :reviews
    has_many :reviewers, through: :reviews, source: :user
    validates :title, uniqueness: {scope: :year, message: "This film already exists"}
end
