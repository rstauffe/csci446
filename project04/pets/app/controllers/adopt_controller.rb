class AdoptController < ApplicationController
  def index
    @cat = Cat.find(params[:pet_id])
  end
  
  def new
    @adopt = Adopt.new
  end
  
  # POST /adopt
  def create
    @cat = Cat.find(params[:pet_id])
  end
end
