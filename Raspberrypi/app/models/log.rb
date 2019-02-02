class Log < ApplicationRecord
  scope :last_one, -> { order(created_at: :desc).limit(1).first }
end
