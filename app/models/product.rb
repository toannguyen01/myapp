class Product < ActiveRecord::Base
  belongs_to :category, optional: true
  
  validates :title, :description, presence: true
  validates_numericality_of :price, greater_than: 0 
  validate :description_longer_than_title
  scope :published, -> { where(published: true)}
  # scope :description_includes, -> { where('description ILIKE ?', '%ruby' )}
  before_save :strip_html_from_description, :downcase_field

  def downcase_field
    self.title = title.downcase
  end

  def strip_html_from_description
    self.description = ActionView::Base.full_sanitizer.sanitize(self.description)
  end
  def description_longer_than_title
    return if title.blank? or description.blank?
    if description.length < title.length
      errors.add(:description, 'can\'t be shorter than title ')
    end
  end
end