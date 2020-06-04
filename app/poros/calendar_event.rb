class CalendarEvent
  attr_reader :start_time, :entry, :mood

  def initialize(info)
    @start_time = info[:start_time]
    @entry = info[:entry]
    @mood = info[:mood]
  end
end
