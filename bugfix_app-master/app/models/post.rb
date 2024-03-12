# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true, length: { maximum: 1000 }
end
