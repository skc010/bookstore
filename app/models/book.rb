class Book < ActiveRecord::Base
	scope :bargins, -> { where('price < 10.00')}
	scope :by, ->(author) { where('author = ?', author)}

	has_many :reviews
	validates :title, :author, :pages, :price, presence: true
	validates :pages,
		numericality: { only_integer: true, greater_than_or_equal_to: 0},
		unless: "pages.blank?"
	validates :price,
		numericality: {greater_than_or_equal_to: 0},
		if: "price.present?"

	def average_stars
		reviews.average(:stars)
	end
end
