class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
   end

   private
   
     def comment_params
       params.require(:comment)
       .permit(:atmosphere, :growth_potential, :gap, :treatment, :reason_for_retirement)
       .merge(worker_id: current_worker.id, salon_id: params[:salon_id])
     end
end
