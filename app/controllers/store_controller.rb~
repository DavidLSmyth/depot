class StoreController < ApplicationController
  def index
		@products = Product.order(:title)
  end
	def store
		@t=Time.now.utc.to_s
	end
end
