class AdoptController < ApplicationController
  include CurrentSelection
  before_action :set_selection, only: [:create, :index]
  
  def index
    @cat = Cat.find(params[:cat_id])
    @latest_cat = @cat
  end
  
  def new
    @adopt = Adopt.new
  end
  
  # POST /adopt
  def create
    @cat = Cat.find(params[:cat_id])
  end
end
