class Membership < ApplicationRecord
  belongs_to :gym
  belongs_to :client

  validates :charge, presence: true
  validates :client_id, uniqueness: {scope: :gym_id, message: "already belongs to this gym."}, presence: true
  validates :gym_id, presence: true
end
