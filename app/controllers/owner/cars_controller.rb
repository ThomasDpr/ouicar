module Owner
  class CarsController < ApplicationController
    def index
      @cars = Cars.all
    end

    def new
      @car = Car.new
    end

    def create
      @car = Car.new(owner_params)
      @car.owner = current_user
      if @car.save
        redirect_to car_path(@car), notice: 'Car added ✔️'
      else
        render 'cars/index', status: :unprocessable_entity
      end
    end

    def edit
      @car = Car.find(params[:id])
    end

    def update
      @car = Car.find(params[:id])
      if @car.update(owner_params)
        redirect_to car_path(@car), notice: 'Car updated ✔️'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @car = Car.find(params[:id])
      @car.destroy
      redirect_to cars_path, notice: 'Car deleted ✔️'
    end

    private

    def owner_params
      params.require(:car).permit(:brand, :descriptiton, :color, :price_per_day, :photo)
    end
  end
end
