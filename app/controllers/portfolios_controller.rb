# frozen_string_literal: true

class PortfoliosController < ApplicationController
  before_action :find_portfolio, only: %i[show edit update destroy]

  def index
    @portfolio_items = Portfolio.all
  end

  def new
    @portfolio_item = Portfolio.new
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: "Portifolio has created." }
      else
        format.html { render :new }
      end
    end
  end

  def edit; end

  def show; end

  def update
    if @portfolio_item.update(portfolio_params)
      redirect_to portfolios_path, notice: "Portfolio has updated"
    else
      render :edit
    end
  end

  def destroy
    @portfolio_item.destroy

    redirect_to portfolios_path, notice: "Portfolio has deleted"
  end

  private

  def find_portfolio
    @portfolio_item = Portfolio.find(params[:id])
  end

  def portfolio_params
    params.require(:portfolio).permit(:title, :subtitle, :body)
  end
end
