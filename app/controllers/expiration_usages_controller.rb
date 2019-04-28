class ExpirationUsagesController < ApplicationController
  before_action :set_expiration_usage, only: [:show, :edit, :update, :destroy]

  # GET /expiration_usages
  # GET /expiration_usages.json
  def index
    @expiration_usages = ExpirationUsage.all
  end

  # GET /expiration_usages/1
  # GET /expiration_usages/1.json
  def show
  end

  # GET /expiration_usages/new
  def new
    @expiration_usage = ExpirationUsage.new
  end

  # GET /expiration_usages/1/edit
  def edit
  end

  # POST /expiration_usages
  # POST /expiration_usages.json
  def create
    @expiration_usage = ExpirationUsage.new(expiration_usage_params)

    respond_to do |format|
      if @expiration_usage.save
        format.html { redirect_to @expiration_usage, notice: 'Expiration usage was successfully created.' }
        format.json { render :show, status: :created, location: @expiration_usage }
      else
        format.html { render :new }
        format.json { render json: @expiration_usage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expiration_usages/1
  # PATCH/PUT /expiration_usages/1.json
  def update
    respond_to do |format|
      if @expiration_usage.update(expiration_usage_params)
        format.html { redirect_to @expiration_usage, notice: 'Expiration usage was successfully updated.' }
        format.json { render :show, status: :ok, location: @expiration_usage }
      else
        format.html { render :edit }
        format.json { render json: @expiration_usage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expiration_usages/1
  # DELETE /expiration_usages/1.json
  def destroy
    @expiration_usage.destroy
    respond_to do |format|
      format.html { redirect_to expiration_usages_url, notice: 'Expiration usage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expiration_usage
      @expiration_usage = ExpirationUsage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expiration_usage_params
      params.require(:expiration_usage).permit(:usage)
    end
end
