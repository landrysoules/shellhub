class SnipetsController < ApplicationController
  # FIXME: check if set_snipet has to be executed before show
  before_action :set_snipet, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /snipets
  def index
    @snipets = Snipet.all
  end

  def my_snipets
    @snipets = Snipet.where(user_id: current_user.id)
    #render "snipets/index"
    #render @snipets
  end

  # GET /snipets/1
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
    #render "snipets/index"
    #render @snipets
  end

  # GET /snipets/1/edit
  def edit
  end

  # POST /snipets
  def create
    @snipet = Snipet.new(snipet_params)
    @snipet.user_id = current_user.id
    @snipet.username = current_user.username
    respond_to do
      if @snipet.save
        redirect_to my_snipets_url(current_user.id), notice: 'Snipet was successfully created.' 
      else
        render :new 
      end
    end
  end

  # PATCH/PUT /snipets/1
  def update
    respond_to do
      if @snipet.update(snipet_params)
        redirect_to @snipet, notice: 'Snipet was successfully updated.'
      else
        render :edit
      end
    end
  end

  # DELETE /snipets/1
  def destroy
    @snipet.destroy
    respond_to do |format|
      redirect_to snipets_url, notice: 'Snipet was successfully destroyed.' 
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
