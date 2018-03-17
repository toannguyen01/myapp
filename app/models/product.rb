class Product < ActiveRecord::Base
  validates :title, :description, presence: true
  validates :price, format: { with: /\A\d+\z/, message: "Integer only. No sign allowed." }
  validate :description_longer_than_title

  def description_longer_than_title
    return if title.blank? or description.blank?
    if description.length < title.length
      errors.add(:description, 'can\'t be shorter than title ')
    end
  end
end