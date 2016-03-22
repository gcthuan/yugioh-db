class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit, :update, :destroy]
  impressionist actions: [:show]
  # GET /cards
  # GET /cards.json
  def index
    params[:page] = 1 if params[:page].blank?
    @cards = Card.order("name").page params[:page]
  end

  # GET /cards/1
  # GET /cards/1.json
  def show
    impressionist(@card, "#{@card} is visited.")
  end

  # return top 10 most popular cards
  # GET /cards/popular.json
  def show_most_popular
    @cards = Card.order("impressions_count DESC")[0..19]
  end

  # filter card by family or type
  # GET /cards/find?family=val1&type=val2
  def search
    @cards = Card.where("data ->> 'family' = '#{params[:family]}' OR data ->> 'type' = '#{params[:type]}'").page params[:page]
  end

  # random one card from the db
  # GET /cards/random
  def random_one
    @card = Card.order("RANDOM()").limit(1).first
  end

  # GET /cards/new
  def new
    @card = Card.new
  end

  # GET /cards/1/edit
  def edit
  end

  # POST /cards
  # POST /cards.json
  def create
    @card = Card.new(card_params)

    respond_to do |format|
      if @card.save
        format.html { redirect_to @card, notice: 'Card was successfully created.' }
        format.json { render :show, status: :created, location: @card }
      else
        format.html { render :new }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cards/1
  # PATCH/PUT /cards/1.json
  def update
    respond_to do |format|
      if @card.update(card_params)
        format.html { redirect_to @card, notice: 'Card was successfully updated.' }
        format.json { render :show, status: :ok, location: @card }
      else
        format.html { render :edit }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cards/1
  # DELETE /cards/1.json
  def destroy
    @card.destroy
    respond_to do |format|
      format.html { redirect_to cards_url, notice: 'Card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card
      @card = Card.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_params
      params.fetch(:card, {})
    end
end
