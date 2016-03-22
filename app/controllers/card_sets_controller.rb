class CardSetsController < ApplicationController
  before_action :set_card_set, only: [:show, :edit, :update, :destroy]
  impressionist actions: [:show]
  # GET /card_sets
  # GET /card_sets.json
  def index
    params[:page] = 1 if params[:page].blank?
    @card_sets = CardSet.order("name").page params[:page]
  end

  # GET /card_sets/1
  # GET /card_sets/1.json
  def show
    impressionist(@card_set, "#{@card_set} is visited.")
  end

  #return 10 most popular cards
  # GET /card_sets/popular.json
  def show_most_popular
    @card_sets = CardSet.order("impressions_count DESC")[0..19]
  end

  # GET /card_sets/new
  def new
    @card_set = CardSet.new
  end

  # GET /card_sets/1/edit
  def edit
  end

  # POST /card_sets
  # POST /card_sets.json
  def create
    @card_set = CardSet.new(card_set_params)

    respond_to do |format|
      if @card_set.save
        format.html { redirect_to @card_set, notice: 'Card set was successfully created.' }
        format.json { render :show, status: :created, location: @card_set }
      else
        format.html { render :new }
        format.json { render json: @card_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /card_sets/1
  # PATCH/PUT /card_sets/1.json
  def update
    respond_to do |format|
      if @card_set.update(card_set_params)
        format.html { redirect_to @card_set, notice: 'Card set was successfully updated.' }
        format.json { render :show, status: :ok, location: @card_set }
      else
        format.html { render :edit }
        format.json { render json: @card_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /card_sets/1
  # DELETE /card_sets/1.json
  def destroy
    @card_set.destroy
    respond_to do |format|
      format.html { redirect_to card_sets_url, notice: 'Card set was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card_set
      @card_set = CardSet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_set_params
      params.fetch(:card_set, {})
    end
end
