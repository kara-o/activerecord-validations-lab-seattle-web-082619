class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :is_clickbait?

  def is_clickbait?
      if title.present?
        unless ["Won't Believe", "Secret", "Top [number]", "Guess"].any? { |clickbait| title.include?(clickbait) }
          errors[:title] << 'Need a title with something click-baity!'
        end
      end 
  end

end
