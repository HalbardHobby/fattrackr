class Log < ApplicationRecord
  paginates_per 50

  belongs_to :user
  scope :intakes, -> {where(intake: true)}
  scope :expenses, -> {where(intake: false)}
  
  validates :description, presence: true
  validates :calories, numericality: { greater_than_or_equal_to: 0 }
  validates :protein, numericality: { greater_than_or_equal_to: 0, allow_nil: true }
  validates :carb, numericality: { greater_than_or_equal_to: 0, allow_nil: true }
  validates :fat, numericality: { greater_than_or_equal_to: 0, allow_nil: true }
  validates :alcochol, numericality: { greater_than_or_equal_to: 0, allow_nil: true }
end
