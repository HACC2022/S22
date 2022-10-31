class Link < ApplicationRecord
  validates :original_url, presence: true, length: { minimum: 10}
  validates :short_code, presence: true, uniqueness: true, length: { minimum: 6}
end
