class SnipetsController < ApplicationController
  # FIXME: check if set_snipet has to be executed before show
  before_action :set_snipet, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /snipets
  # GET /snipets.json
  def index
    @snipets = Snipet.all
  end

  def my_snipets
    @snipets = Snipet.where(user_id: current_user.id)
    render "snipets/index"
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

  def save_execution_output
    snipet = Snipet.find params[:id]
    snipet.execution_output = params[:output]
    snipet.save
    flash[:success] = "Snipet successfully saved."
    @snipets = Snipet.all
    render "snipets/index"
  end

  # GET /snipets/1/edit
  def edit
  end

  # POST /snipets
  # POST /snipets.json
  def create
    @snipet = Snipet.new(snipet_params)
    @snipet.user_id = current_user.id
    @snipet.username = current_user.username
    respond_to do |format|
      if @snipet.save
        format.html { redirect_to my_snipets_url(current_user.id), notice: 'Snipet was successfully created.' }
      else
        format.html { render :new }
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
