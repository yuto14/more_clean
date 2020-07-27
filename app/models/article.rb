class Article < ApplicationRecord

    attachment :article_image

    belongs_to :user
    has_many :article_comments, dependent: :destroy
    has_many :favorites, dependent: :destroy

    validates :text,  length: { in: 1..3000 }
    validates :title, length: { in: 1..50 }

    acts_as_taggable

    def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end
end
