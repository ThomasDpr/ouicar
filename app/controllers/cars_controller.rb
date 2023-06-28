class CarsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @cars = Car.all

    # Ici la query permet de chercher dans la colonne brand de la table cars
    sql_subquery = 'brand ILIKE :query'
    if params[:query].present?
      @cars = Car.where(sql_subquery, query: "%#{params[:query]}%")
    end

    if params[:cars_filter]
      start_date = Date.parse(params[:cars_filter][:start_date]) if params[:cars_filter][:start_date].present?
      end_date = Date.parse(params[:cars_filter][:end_date]) if params[:cars_filter][:end_date].present?
      @cars = @cars.available_between(start_date, end_date)
    end
  end

  def show
    @car = Car.find(params[:id])
  end
end
