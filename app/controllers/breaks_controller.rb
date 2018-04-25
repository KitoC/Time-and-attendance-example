class BreaksController < ApplicationController
  before_action :set_break, only: [:show, :edit, :update, :destroy]







  def create
    @break = Break.new(break_params)
    @break.shift = current_user.shiftweeks.last.shifts.last


    respond_to do |format|
      if @break.save
        current_user.update(on_break: true)
        format.html { redirect_to '/' , notice: 'Break was successfully created.' }
        format.json { render :show, status: :created, location: @break }
      else
        format.html { redirect_to '/' }
        format.json { render json: @break.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @break.update(break_params)
        current_user.update(on_break: false)

        format.html { redirect_to '/' , notice: 'Break was successfully updated.' }
        format.json { render :show, status: :ok, location: @break }
      else
        format.html { redirect_to '/'  }
        format.json { render json: @break.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @break.destroy
    respond_to do |format|
      format.html { redirect_to breaks_url, notice: 'Break was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_break
      @break = Break.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def break_params
      params.require(:break).permit(:clockout, :clockin, :shift_id)
    end
end
