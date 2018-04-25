class PagesController < ApplicationController
  before_action :set_shiftweek, only: [:show]

  before_action :authenticate_user!
  before_action :check_last_shift



  def clockin
    @shift = current_user.shiftweeks.last
    @on_shift = current_user.on_shift
    @on_break = current_user.on_break
  end

  def index
    @shiftweeks = current_user.shiftweeks.all
  end

  def show

  end

  private
  # def set_user
  #   @user = User.find(params[:id])
  # end

  def set_shiftweek
    @shiftweek = current_user.shiftweeks.find(params[:id]).shifts
  end

  def check_last_shift
        if current_user.shiftweeks.last.week_ending == last_shiftweek_check
          shift_w = Shiftweek.new(week_ending: day_check, user_id: current_user.id)
          shift_w.save
        end
  end

  def day_check
    today = Time.now.strftime('%a')
    return 6.days.from_now.strftime("%d/%m/%Y") if today == 'Mon'
    return 5.days.from_now.strftime("%d/%m/%Y") if today == 'Tue'
    return 4.days.from_now.strftime("%d/%m/%Y") if today == 'Wed'
    return 3.days.from_now.strftime("%d/%m/%Y") if today == 'Thu'
    return 2.days.from_now.strftime("%d/%m/%Y") if today == 'Fri'
    return 1.days.from_now.strftime("%d/%m/%Y") if today == 'Sat'
    return Time.now.strftime("%d/%m/%Y") if today == 'Mon'
  end

  def last_shiftweek_check
    today = Time.now.strftime('%a')
    return -6.days.from_now.strftime("%d/%m/%Y") if today == 'Mon'
    return -5.days.from_now.strftime("%d/%m/%Y") if today == 'Tue'
    return -4.days.from_now.strftime("%d/%m/%Y") if today == 'Wed'
    return -3.days.from_now.strftime("%d/%m/%Y") if today == 'Thu'
    return -2.days.from_now.strftime("%d/%m/%Y") if today == 'Fri'
    return -1.days.from_now.strftime("%d/%m/%Y") if today == 'Sat'
    return Time.now.strftime("%d/%m/%Y") if today == 'Mon'
  end


end
