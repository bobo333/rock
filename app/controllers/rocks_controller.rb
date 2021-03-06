class RocksController < ApplicationController

    before_action :authenticate_user!, only: [:new, :create, :my_rocks]

    def index
        @rocks = Rock.all.order(created_at: :desc)
    end

    def my_rocks
        @rocks = current_user.rocks
    end

    def show
        @rock = Rock.find_by_id(params[:id])
    end

    def create
        new_rock = Rock.create(rock_params)
        new_rock.user = current_user
        new_rock.save
        if new_rock.errors.blank?
            redirect_to action: :index
        else
            @rock = new_rock
            render :new
        end
    end

    def new
        @rock = Rock.new
    end

    private

    def rock_params
        params.require(:rock).permit(:title, :description, :image)
    end

end
