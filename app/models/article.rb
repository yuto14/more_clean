class Article < ApplicationRecord

    attachment :article_image

    belongs_to :user
    has_many :article_comments, dependent: :destroy

    validates :title, :text,   presence: true
end
