module PagesHelper
  def convert_hours(convert)

    conversion = (convert.getlocal.strftime("%H").to_f * 60) + convert.getlocal.strftime("%M").to_f

    return conversion

  end

  def break_time(shift)
    total_breaktime = 0.0
    breaktime = 0
    shift.breaks.each do |breaked|
      unless shift.breaks == nil
        breaktime = (convert_hours(breaked.clockout) - convert_hours(breaked.clockin))

        total_breaktime += (breaktime / 60).round(2)
      end
    end
    return total_breaktime
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
