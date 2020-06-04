RSpec.describe CalendarEvent, type: :model do
  describe 'attributes' do
    it 'has start_time, entry, and mood attributes' do
      event_info = { start_time: Date.today,
                     entry: 'I felt great today',
                     mood: 'happy' }
      event = CalendarEvent.new(event_info)
      expect(event.start_time).to eq(Date.today)
      expect(event.entry).to eq('I felt great today')
      expect(event.mood).to eq('happy')
    end
  end
end
