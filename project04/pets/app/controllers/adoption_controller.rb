class AdoptionController < ApplicationController
  def index
		@cats = Cat.order(:name)
  end
end
