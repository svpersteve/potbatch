class Recipe < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  validates :prep_time, { presence: true, length: { maximum: 5, message: 'should be no longer than 5 characters, e.g. 10m' } }
  validates :cooking_time, { presence: true, length: { maximum: 5, message: 'should be no longer than 5 characters, e.g. 10m' } }
  validates :serves, { presence: true, numericality: { less_than_or_equal_to: 200, message: "We're not Jesus, recipes should serve fewer than 200 people" } }
end
