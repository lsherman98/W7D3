class Album < ApplicationRecord
  validates :title, :year, :band_id, presence: true
  validates :title, uniqueness: {scope: :band_id}
  # validates :live, inclusion: ["true", "false"]
  
  belongs_to :band

end
