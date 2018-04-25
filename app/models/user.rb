class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :shiftweeks, dependent: :destroy

  after_create :do_stuff
  def do_stuff
    shift_w = Shiftweek.new( user_id: self.id, week_ending: day_check)
    shift_w.save
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
end
