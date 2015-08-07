class RockCommentsController < ApplicationController

    before_action :authenticate_user!, only: [:new, :create]

    def create
        new_rock_comment = RockComment.create(rock_comment_params)
        new_rock_comment.user = current_user
        new_rock_comment.save
        redirect_to rock_path(new_rock_comment.rock)
    end

    def new
        @rock = Rock.find_by_id(params[:rock_id])
        @rock_comment = RockComment.new
    end

    private

    def rock_comment_params
        params.require(:rock_comment).permit(:text, :rock_id)
    end

end
