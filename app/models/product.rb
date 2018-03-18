class Product < ActiveRecord::Base
  validates :title, :description, presence: true
  validates_numericality_of :price, greater_than: 0 
  validate :description_longer_than_title
  scope :published, -> { where(published: true)}
  # scope :description_includes, -> { where('description ILIKE ?', '%ruby' )}
  def description_longer_than_title
    return if title.blank? or description.blank?
    if description.length < title.length
      errors.add(:description, 'can\'t be shorter than title ')
    end
  end
end