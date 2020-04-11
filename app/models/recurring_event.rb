class RecurringEvent < ApplicationRecord
    belongs_to :user

    enum frequency: { daily: 0, weekly: 1, monthly: 2, yearly: 3 }

    validates :title, presence: true
    validates :anchor, presence: true
    validates :frequency, presence: true
  
    def schedule
      @schedule ||= begin
        schedule = IceCube::Schedule.new(now = anchor)
        case frequency      
        when 'daily'
          schedule.add_recurrence_rule IceCube::Rule.daily(1)
        when 'weekly'
          schedule.add_recurrence_rule IceCube::Rule.weekly(1)
        when 'monthly'
          schedule.add_recurrence_rule IceCube::Rule.monthly(1)
        when 'yearly'
          schedule.add_recurrence_rule IceCube::Rule.yearly(1)
        end
        schedule
      end
    end
  
    def events(start_date, end_date)
      start_frequency = start_date ? start_date.to_date : Date.today - 1.year
      end_frequency = end_date ? end_date.to_date : Date.today + 1.year
      schedule.occurrences_between(start_frequency, end_frequency)
    end
end
