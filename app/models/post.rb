class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: {minimum: 250} 
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :clickbait_title

  def clickbait_title
    unless title.present? && title.match?(/Won't Believe|Secret|Top \d+|Guess/)
      errors.add(:title, "must be sufficiently clickbait-y")
    end
  end
end
