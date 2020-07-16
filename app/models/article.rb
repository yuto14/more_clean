class Article < ApplicationRecord

    attachment :article_image

    belongs_to :user
    has_many :article_comments, dependent: :destroy
    has_many :favorites, dependent: :destroy

    validates :title, :text,   presence: true

    def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end
end
