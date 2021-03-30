class Log < ApplicationRecord
  belongs_to :user
  scope :intakes, -> {where(intake: true)}
  scope :expenses, -> {where(intake: false)}
end
