class Vehicle < ApplicationRecord

  validates :brand, presence: true
  validates :sold, :vehicle, inclusion: { in: [true, false], message: 'can\'t be blank' }

end