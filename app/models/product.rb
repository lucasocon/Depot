class Product < ActiveRecord::Base
	has_many :line_items
	has_many :orders, through: :line_items

	validates :title, :description, :image_url, presence: true
	validates :price, numericality: {greater_than_or_equal_to: 0.01}
	validates :title, uniqueness: true
	before_destroy :ensure_not_referenced_by_any_line_item

	scope :brand_new, ->     { order("created_at DESC").limit(5) }
	scope :editors_pick, ->  { order("featured_at DESC").limit(5) }
	scope :most_popular, ->  { order("sells DESC").limit(5) }

	private

	# ensure that there are no line items referencing this product

	def ensure_not_referenced_by_any_line_item
		if line_items.empty?
			return true
		else
			errors.add(:base, 'Line Items present')
			return false
		end
	end

	def self.latest
		Product.order(:updated_at).last
	end
end
