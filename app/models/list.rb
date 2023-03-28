class List < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
  has_many :reviews
  has_one_attached :photo

  def background_image_url
    if photo.attached?
      cl_image_path(photo.key, :transformation => [{:width => 400, :height => 300, :crop => :fill}], :secure => true)
    else
      # URL de l'image par défaut
      ActionController::Base.helpers.asset_path("cinema.jpg")
    end
  end

end
