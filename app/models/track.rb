class Tracks < ApplicationRecord
    validates :title, :ord, :bonus, :album_id, presence: true
    belongs_to :album, dependent: :destroy
    has_one :band, through: :albums
end