class Vocabulary < ApplicationRecord
  paginates_per 10
  belongs_to :user

  # ===========validation=================#
  validates :user_id, presence: true
  validates :word, presence: true
  validates :meaning, presence: true
end