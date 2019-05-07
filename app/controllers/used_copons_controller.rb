class UsedCoponsController < ApplicationController
  before_action :set_used_copon, only: [:show, :edit, :update, :destroy]

  # GET /used_copons
  # GET /used_copons.json
  def index
    @used_copons = UsedCopon.all
  end

  # GET /used_copons/1
  # GET /used_copons/1.json
  def show
  end

  # GET /used_copons/new
  def new
    @used_copon = UsedCopon.new
  end

  # GET /used_copons/1/edit
  def edit
  end

  # POST /used_copons
  # POST /used_copons.json
  def create
    @used_copon = UsedCopon.new(used_copon_params)
    @used_copon.user = current_user
    @used_copon.copon = Copon.get_by_id(params[:copon_id])

    respond_to do |format|
      if @used_copon.save
        format.html { redirect_to products_path, notice: 'Copon was used successfully.' }
      end
    end
  end

  # PATCH/PUT /used_copons/1
  # PATCH/PUT /used_copons/1.json
  def update
    respond_to do |format|
      if @used_copon.update(used_copon_params)
        format.html { redirect_to @used_copon, notice: 'Used copon was successfully updated.' }
        format.json { render :show, status: :ok, location: @used_copon }
      else
        format.html { render :edit }
        format.json { render json: @used_copon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /used_copons/1
  # DELETE /used_copons/1.json
  def destroy
    @used_copon.destroy
    respond_to do |format|
      format.html { redirect_to used_copons_url, notice: 'Used copon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_used_copon
      @used_copon = UsedCopon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def used_copon_params
      puts "-- " + params.inspect
      params.fetch(:used_copon, {})
    end
end
