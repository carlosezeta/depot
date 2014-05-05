class Product < ActiveRecord::Base
  attr_accessible :description, :image_url, :price, :title
  default_scope :order => 'title'
  has_many :line_items

  before_destroy :ensure_not_referenced_by_any_line_item

  searchkick

  # comprobar que no hay pedidos referentes a este producto
  def ensure_not_referenced_by_any_line_item
  	if line_items.count.zero?
  		return true
  	else
  		errors[:base] << "Line items present"
  		return false
  	end
  end

  validates :title, :description, :image_url, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :title, :uniqueness => true, length: {minimum: 3}
  validates :image_url, :format => {
  	:with    => %r{\.(gif|jpg|jpeg|png)$}i,
  	:message => 'must be a URL for GIF, JPG or PNG image.'
  }
end
