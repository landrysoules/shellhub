class SnipetsController < ApplicationController
  before_action :set_snipet, only: [:show, :edit, :update, :destroy]

  # GET /snipets
  # GET /snipets.json
  def index
    @snipets = Snipet.all
  end

  # GET /snipets/1
  # GET /snipets/1.json
  def show
    if @snipet.user_id
      @author = User.find(@snipet.user_id)
    end
  end

  # GET /snipets/new
  def new
    @snipet = Snipet.new
  end

  # GET /snipets/1/edit
  def edit
  end

  # POST /snipets
  # POST /snipets.json
  def create
    @snipet = Snipet.new(snipet_params)
    @snipet.user_id = current_user.id

    respond_to do |format|
      if @snipet.save
        format.html { redirect_to @snipet, notice: 'Snipet was successfully created.' }
        format.json { render :show, status: :created, location: @snipet }
      else
        format.html { render :new }
        format.json { render json: @snipet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /snipets/1
  # PATCH/PUT /snipets/1.json
  def update
    respond_to do |format|
      if @snipet.update(snipet_params)
        format.html { redirect_to @snipet, notice: 'Snipet was successfully updated.' }
        format.json { render :show, status: :ok, location: @snipet }
      else
        format.html { render :edit }
        format.json { render json: @snipet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /snipets/1
  # DELETE /snipets/1.json
  def destroy
    @snipet.destroy
    respond_to do |format|
      format.html { redirect_to snipets_url, notice: 'Snipet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_snipet
      @snipet = Snipet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def snipet_params
      params.require(:snipet).permit(:title, :content, :execution_output)
    end
end
