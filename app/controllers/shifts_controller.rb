class ShiftsController < ApplicationController
  before_action :set_shift, only: [:show, :edit, :update, :destroy]

  # GET /shifts
  # GET /shifts.json
  def index
    @shifts = current_user.shiftweeks.last.shifts
  end




  # POST /shifts
  # POST /shifts.json
  def create
    @shift = Shift.new(shift_params)
    @shift.shiftweek = current_user.shiftweeks.last


    respond_to do |format|
      if @shift.save
        current_user.update(on_shift: true)
        format.html { redirect_to '/', notice: 'Shift was successfully created.' }
        format.json { render :show, status: :created, location: @shift }
      else
        format.html { redirect_to '/' }
        format.json { render json: @shift.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shifts/1
  # PATCH/PUT /shifts/1.json
  def update
    respond_to do |format|
      if @shift.update(shift_params)
        current_user.update(on_shift: false)
        format.html { redirect_to '/', notice: 'Shift was successfully updated.' }
        format.json { render :back, status: :ok, location: @shift }
      else
        format.html { redirect_to '/' }
        format.json { render json: @shift.errors, status: :unprocessable_entity }
      end
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shift
      @shift = Shift.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shift_params
      params.require(:shift).permit(:clockout, :clockin, :user_id, :shiftweek_id)
    end
end
