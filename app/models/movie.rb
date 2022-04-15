class Movie < ApplicationRecord
  # has_and_belongs_to_many :characters
  has_many :character_movies
  has_many :characters, through: :character_movies
  has_many :genders
end
