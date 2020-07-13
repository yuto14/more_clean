class Article < ApplicationRecord

    attachment :article_image

    belongs_to :user

    validates :title, :text,   presence: true
end
