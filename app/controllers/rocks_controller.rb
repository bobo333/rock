class RocksController < ApplicationController

    before_action :authenticate_user!, only: [:new]

    def index
        @rocks = Rock.all
    end

    def show

    end

    def create
        new_rock = Rock.create(rock_params)
        new_rock.user = current_user
        new_rock.save
        redirect_to action: :index
    end

    def new
        @rock = Rock.new
    end

    private

    def rock_params
        params.require(:rock).permit(:title, :description, :image)
    end

end
