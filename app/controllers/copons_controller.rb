class CoponsController < ApplicationController
  before_action :set_copon, only: [:show, :edit, :update, :destroy]

  # GET /copons
  # GET /copons.json
  def index
    @copons = Copon.all
  end

  # GET /copons/1
  # GET /copons/1.json
  def show
  end

  # GET /copons/new
  def new
    @copon = Copon.new
  end

  # GET /copons/1/edit
  def edit
  end

  # POST /copons
  # POST /copons.json
  def create
    @copon = Copon.new(copon_params)
    get_product(@copon, params.require(:copon)[:product])
    set_associative_criteria @copon, params.require(:copon)

    respond_to do |format|
      if @copon.save
        format.html { redirect_to @copon, notice: 'Copon was successfully created.' }
        format.json { render :show, status: :created, location: @copon }
      else
        format.html { render :new }
        format.json { render json: @copon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /copons/1
  # PATCH/PUT /copons/1.json
  def update
    set_associative_criteria @copon, params.require(:copon)
    get_product(@copon, params.require(:copon)[:product])
    respond_to do |format|
      if @copon.update(copon_params)
        format.html { redirect_to @copon, notice: 'Copon was successfully updated.' }
        format.json { render :show, status: :ok, location: @copon }
      else
        format.html { render :edit }
        format.json { render json: @copon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /copons/1
  # DELETE /copons/1.json
  def destroy
    @copon.destroy
    respond_to do |format|
      format.html { redirect_to copons_url, notice: 'Copon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_copon
      @copon = Copon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def copon_params
      params.require(:copon).permit(:has_fixed_amount, :discount, :expiration_type)
    end

    def set_associative_criteria(copon, params)
      if params[:expiration_type] == "usage"
        copon.associative = params[:expiration_usage]
      else
        copon.associative = params[:expiration_date]
      end
    end

    def get_product(copon, params)
      copon.product = Product.get_by_id(params)
    end

end
