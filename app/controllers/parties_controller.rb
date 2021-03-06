class PartiesController < ApplicationController
  # before_action :set_party, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def add_attributes

  end

  def add_student
    @party = Party.find(params[:party_id])
    student = User.find_by(email: params[:email])

    begin
      @party.users << student
      @party.save

      if student.user_attribute.nil?
        student.user_attribute = UserAttribute.new do |user_attribute|
          user_attribute.level = 1
          user_attribute.health = 100
          user_attribute.mana = 50
          user_attribute.gold = 0
          user_attribute.experience = 0
        end
      end

      message = "Temos um novo aluno em nossa party"
    rescue Exception => e
      message = "Erro: " + e.message
    end

    redirect_back fallback_location: root_path, alert: message
  end

  # GET /parties
  # GET /parties.json
  def index
    @parties = Party.all
  end

  # GET /parties/1
  # GET /parties/1.json
  def show
    set_party
  end

  # GET /parties/new
  def new
    @party = Party.new
  end

  # GET /parties/1/edit
  def edit
    set_party
  end

  # POST /parties
  # POST /parties.json
  def create
    @party = Party.new(party_params)

    respond_to do |format|
      if @party.save
        format.html { redirect_to @party, notice: 'Party was successfully created.' }
        format.json { render :show, status: :created, location: @party }
      else
        format.html { render :new }
        format.json { render json: @party.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parties/1
  # PATCH/PUT /parties/1.json
  def update
    respond_to do |format|
      if @party.update(party_params)
        format.html { redirect_to @party, notice: 'Party was successfully updated.' }
        format.json { render :show, status: :ok, location: @party }
      else
        format.html { render :edit }
        format.json { render json: @party.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parties/1
  # DELETE /parties/1.json
  def destroy
    @party = Party.find(params[:id])
    if @party.present?
      @party.destroy
    end

    respond_to do |format|
      format.html { redirect_to parties_url, notice: 'Party was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_party
      @party = Party.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def party_params
      params.require(:party).permit(:name, :begin, :end, :hours, :image)
    end
end
