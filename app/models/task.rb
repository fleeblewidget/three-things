class Task < ApplicationRecord
  attribute :promoted, :boolean, default: false
  
  validates :summary, presence: true
  validates :promoted, inclusion: { in: [true, false] }
end
