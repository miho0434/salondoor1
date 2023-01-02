class CommentsController < ApplicationController

  def new
    @comment = Comment.new
    @salon = Salon.find(params[:salon_id])
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to salons_path
    else
      render :new
    end
   end

   private
   
     def comment_params
       params.require(:comment)
       .permit(:atmosphere, :growth_potential, :gap, :treatment, :reason_for_retirement)
       .merge(worker_id: current_worker.id, salon_id: params[:salon_id])
     end
end
