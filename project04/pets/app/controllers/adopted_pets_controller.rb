class AdoptedPetsController < ApplicationController
  before_action :set_adopted_pet, only: [:show, :edit, :update, :destroy]

  # GET /adopted_pets
  # GET /adopted_pets.json
  def index
    @adopted_pets = AdoptedPet.all
  end

  # GET /adopted_pets/1
  # GET /adopted_pets/1.json
  def show
  end

  # GET /adopted_pets/new
  def new
    @adopted_pet = AdoptedPet.new
  end

  # GET /adopted_pets/1/edit
  def edit
  end

  # POST /adopted_pets
  # POST /adopted_pets.json
  def create
		@selection = current_selection
		cat = Cat.find(params[:pet_id])
    @adopted_pet = @selection.adopted_pets.build
    #@adopted_pet.cat = cat

    respond_to do |format|
      if @adopted_pet.save
        format.html { redirect_to @adopted_pet.selection, notice: 'Adopted pet was successfully created.' }
        format.json { render action: 'show', status: :created, location: @adopted_pet }
      else
        format.html { render action: 'new' }
        format.json { render json: @adopted_pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /adopted_pets/1
  # PATCH/PUT /adopted_pets/1.json
  def update
    respond_to do |format|
      if @adopted_pet.update(adopted_pet_params)
        format.html { redirect_to @adopted_pet, notice: 'Adopted pet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @adopted_pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adopted_pets/1
  # DELETE /adopted_pets/1.json
  def destroy
    @adopted_pet.destroy
    respond_to do |format|
      format.html { redirect_to adopted_pets_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adopted_pet
      @adopted_pet = AdoptedPet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def adopted_pet_params
      params.require(:adopted_pet).permit(:pet_id, :selection_id)
    end
end
