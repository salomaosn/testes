class PiusController < ApplicationController
  # before_action :set_piu, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /pius
  # GET /pius.json
  def index
    @pius = Piu.all
  end

  # GET /pius/1
  # GET /pius/1.json
  def show
    set_piu
  end

  # GET /pius/new
  def new
    @piu = current_user.pius.new
  end

  # GET /pius/1/edit
  def edit
    @piu = current_user.pius.find(params[:id])
  end

  # POST /pius
  # POST /pius.json
  def create
    @piu = current_user.pius.new(piu_params)

    respond_to do |format|
      if @piu.save
        format.html { redirect_to @piu, notice: 'Piu was successfully created.' }
        format.json { render :show, status: :created, location: @piu }
      else
        format.html { render :new }
        format.json { render json: @piu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pius/1
  # PATCH/PUT /pius/1.json
  def update
    @piu = current_user.pius.find(params[:id])
    respond_to do |format|
      if @piu.update(piu_params)
        format.html { redirect_to @piu, notice: 'Piu atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @piu }
      else
        format.html { render :edit }
        format.json { render json: @piu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pius/1
  # DELETE /pius/1.json
  def destroy
    @piu = current_user.pius.find(params[:id])
    @piu.destroy
    respond_to do |format|
      format.html { redirect_to pius_url, notice: 'Piu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_piu
      @piu = Piu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def piu_params
      params.require(:piu).permit(:user_id, :content, :photo)
    end
end
