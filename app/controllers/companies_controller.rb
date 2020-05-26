class CompaniesController < ApplicationController
  def index
    @orders = Order.where(progress_status: 0)
  end

  def edit
  end

  def show
  end

end