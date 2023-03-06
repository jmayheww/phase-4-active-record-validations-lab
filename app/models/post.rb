class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w[Fiction Non-Fiction] }

  validate :clickbait?

  private

  def clickbait?
    return if title.present? && title.include?("Won't Believe" || 'Secret' || 'Top [number]' || 'Guess')

    errors.add(:title, 'Your title is not sufficiently clickbait-y')
  end
end
