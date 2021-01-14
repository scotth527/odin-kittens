class Kitten < ApplicationRecord
    validates :name, presence: true
    validates :age, presence: true
    validates :softness, presence: true, inclusion: 1..10
    validates :cuteness, presence: true, inclusion: 1..10
end
