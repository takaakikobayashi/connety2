class CompaniesController < ApplicationController
  before_action :authenticate_company!
  before_action :correct_company, only: [:edit, :show, :update, :destroy, :delete]
  before_action :active_company
  def index
    if params["category_id"].nil?
      @scholastic_records = ScholasticRecord.all.page(params[:page]).per(30)
    else
      @scholastic_records = ScholasticRecord.where(category_id: params["category_id"]).page(params[:page]).per(30)
    end
    @categories = Category.all
  end
  
  def edit
    @company = Company.find(params[:id])
  end

  def show
    @offers = Offer.where(company_id: current_company.id)
    @active_offers = Offer.where(company_id: current_company.id, is_active: true)
  end

  def update
    @company = Company.find(current_company.id)
    if @company.update(company_params)
       redirect_to company_path(@company)
    else
       render :edit
    end
  end

  def destroy
    @company = Company.find(current_company.id)
    @company.destroy
    redirect_to root_path
  end

  def delete
    @company = Company.find(current_company.id)
  end

  private
  def company_params
    params.require(:company).permit(
      :name,
      :postal_code,
      :address,
      :email,
      :phone_number
    )
  end
end