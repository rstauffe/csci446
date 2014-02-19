class AdoptionController < ApplicationController
  include CurrentSelection
  before_action :set_selection
  def index
		@cats = Cat.order(:name)
  end
end
