class SuitsController < ApplicationController
  before_action :set_suit, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /suits
  # GET /suits.json
  def index
    if author_signed_in?
      @suits = Suit.where(author_id: current_author.id)
    elsif lawyer_signed_in?
      @suits = Suit.where(lawyer_id: current_lawyer.id)
    end
  end

  # GET /suits/1
  # GET /suits/1.json
  def show
  end

  # GET /suits/new
  def new
    @suit = Suit.new
  end

  # GET /suits/1/edit
  def edit
  end

  # POST /suits
  # POST /suits.json
  def create
    @suit = Suit.new(suit_params)
    @suit.author_id = current_author.id
    if params[:suit][:checked] == '1'
      @suit.lawyer_id = params[:suit][:lawyer_id]
    else
      lawyer_state = Lawyer.where(estado: current_author.estado)
      @suit.lawyer_id = lawyer_state.sample.id
    end  
    respond_to do |format|
      if @suit.save
        format.html { redirect_to @suit, notice: 'Suit was successfully created.' }
        format.json { render :show, status: :created, location: @suit }
      else
        format.html { render :new }
        format.json { render json: @suit.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /suits/1
  # PATCH/PUT /suits/1.json
  def update
    respond_to do |format|
      if @suit.update(suit_params)
        format.html { redirect_to @suit, notice: 'Suit was successfully updated.' }
        format.json { render :show, status: :ok, location: @suit }
      else
        format.html { render :edit }
        format.json { render json: @suit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /suits/1
  # DELETE /suits/1.json
  def destroy
    @suit.destroy
    respond_to do |format|
      format.html { redirect_to suits_url, notice: 'Suit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_suit
      @suit = Suit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def suit_params
      params.require(:suit).permit(:descricao)
    end

    def authenticate_user!
      unless author_signed_in? || lawyer_signed_in?
        redirect_to root_path
      end
    end
end
