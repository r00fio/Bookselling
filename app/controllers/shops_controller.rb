class ShopsController < ApplicationController
  before_action only: [:show]

  # GET /shops/1
  # GET /shops/1.json
  def show
    @shops = [Shop.includes(:books).find(params[:id])]
  end
end
