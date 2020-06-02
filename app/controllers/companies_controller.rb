class CompaniesController < ApplicationController
  def edit
    @company = Company.find(params[:id])
  end

  def show
    @offers = Offer.where(is_active: true)
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
    @offer = Offer.find(params[:id])
    @offer.update(is_active: false)
    redirect_to company_path(current_company.id)
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