class ExpirationDatesController < ApplicationController
  before_action :set_expiration_date, only: [:show, :edit, :update, :destroy]

  # GET /expiration_dates
  # GET /expiration_dates.json
  def index
    @expiration_dates = ExpirationDate.all
  end

  # GET /expiration_dates/1
  # GET /expiration_dates/1.json
  def show
  end

  # GET /expiration_dates/new
  def new
    @expiration_date = ExpirationDate.new
  end

  # GET /expiration_dates/1/edit
  def edit
  end

  # POST /expiration_dates
  # POST /expiration_dates.json
  def create
    @expiration_date = ExpirationDate.new(expiration_date_params)

    respond_to do |format|
      if @expiration_date.save
        format.html { redirect_to @expiration_date, notice: 'Expiration date was successfully created.' }
        format.json { render :show, status: :created, location: @expiration_date }
      else
        format.html { render :new }
        format.json { render json: @expiration_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expiration_dates/1
  # PATCH/PUT /expiration_dates/1.json
  def update
    respond_to do |format|
      if @expiration_date.update(expiration_date_params)
        format.html { redirect_to @expiration_date, notice: 'Expiration date was successfully updated.' }
        format.json { render :show, status: :ok, location: @expiration_date }
      else
        format.html { render :edit }
        format.json { render json: @expiration_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expiration_dates/1
  # DELETE /expiration_dates/1.json
  def destroy
    @expiration_date.destroy
    respond_to do |format|
      format.html { redirect_to expiration_dates_url, notice: 'Expiration date was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expiration_date
      @expiration_date = ExpirationDate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expiration_date_params
      params.require(:expiration_date).permit(:date)
    end
end
