class Movie < ApplicationRecord
    has_many :reviews
    validates :title, uniqueness: {scope: :year, message: "This film already exists"}
end
