class CarsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @cars = Car.all

    sql_subquery = "brand ILIKE :query"

    if params[:query].present?
      @cars = Car.where(sql_subquery, query: "%#{params[:query]}%")
    end

    if params[:car_filter]
      start_date = DateTime.parse(params[:car_filter][:start_date]) if params[:car_filter][:start_date].present?
      end_date = DateTime.parse(params[:car_filter][:end_date]) if params[:car_filter][:end_date].present?
      @cars = @cars.where(start_date: start_date..end_date)
    end
  end

  def show
    @car = Car.find(params[:id])
  end
end
