class RockCommentsController < ApplicationController

    before_action :authenticate_user!, only: [:new, :create]

    def create
        new_rock_comment = RockComment.create(rock_comment_params)
        new_rock_comment.user = current_user
        new_rock_comment.save
        if new_rock_comment.errors.blank?
            redirect_to rock_path(new_rock_comment.rock)
        else
            @rock_comment = new_rock_comment
            @rock = new_rock_comment.rock
            render :new
        end
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
