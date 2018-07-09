class Event < ActiveRecord::Base
  serialize :recurring, Hash

  belongs_to :user

  validates :name, presence: true, length: { in: 5..100 }
  validates :description, length: { in: 1..1_000 }
  validates :start_time, presence: true

  def recurring=(value)
    if RecurringSelect.is_valid_rule?(value) && value != 'null'
      super(RecurringSelect.dirty_hash_to_rule(value).to_hash)
    else
      super(nil)
    end
  end

  def rule
    IceCube::Rule.from_hash(recurring)
  end

  def schedule(start)
    schedule = IceCube::Schedule.new(start)
    schedule.add_recurrence_rule(rule)
    schedule
  end

  def calendar_events(start, user)
    if recurring.empty?
      [self]
    else
      end_date = start.end_of_month.end_of_week
      schedule(start_time).occurrences(end_date).map do |date|
        Event.new(id: id, name: name, start_time: date, user: user)
      end
    end
  end

end
