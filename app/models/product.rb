class Product < ActiveRecord::Base
	@@time =Time.new
	validates :title, :description, :image_url, presence: true
	validates :title, uniqueness: true
	validates :price, numericality: { greater_than_or_equal_to: 0.01 }
	validates :image_url, allow_blank: true, format: {
  		with: %r{\.(gif|jpg|png|jpeg)\Z}i,
  		message: 'must be a URL for GIF, JPG or PNG image.'
	}
	def gettime()
		return "The time is: "+to_s(@@time.now())
	end
end
