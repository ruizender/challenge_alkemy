class Movie < ApplicationRecord
  has_many :characters
  has_many :genders
  belongs_to :character
end
