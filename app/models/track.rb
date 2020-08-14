class Track < ApplicationRecord
    validates :title, :album_id, :ord, presence: true
    validates :bonus, inclusion: { in: [ true, false ] }
    belongs_to :album, dependent: :destroy
    has_one :band, through: :album
    has_many :notes, dependent: :destroy
end