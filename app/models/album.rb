class Album < ApplicationRecord
    validates :title, :year, presence: true
    validates :live, inclusion: { in: [ true, false ] }
    belongs_to :band, dependent: :destroy
    has_many :tracks, dependent: :destroy
end