class Drawing < ApplicationRecord
  include Rails.application.routes.url_helpers

  belongs_to :user
  has_one_attached :drawing

  def get_image_url
    url_for(self.drawing)
  end
end
