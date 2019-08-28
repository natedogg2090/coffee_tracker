class Roaster < ApplicationRecord
  has_many :roasts
  has_many :users, through: :roasts

  validates :name, presence: {message: "can't be blank"}
  # validates :location, allow_blank: true

  scope :recent_roasts, -> (time) {where(":roasted_date < ? ", time)}

end
