class Room < ApplicationRecord
    has_many :messages , dependent: :destroy
    validates :created_for, :name , :created_by , presence: true
end
