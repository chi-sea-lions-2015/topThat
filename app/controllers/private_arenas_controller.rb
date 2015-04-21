class PrivateArenasController < ApplicationController
  def create
    @private_arena = PrivateArena.create(private_arena_params)
  end

  def show
    @private_arena = PrivateArena.find(params[:id])
  end

  def update
    @private_arena = PrivateArena.find(params[:id])
    @private_arena.update_attributes(private_arena_params)
  end

  def destroy
    @private_arena = PrivateArena.find(params[:id])
    @private_arena.destroy!
  end

  private

    def  private_arena_params
      params.require(:private_arena).permit(:challenger_video, :challengee_video, :status)
    end
end
