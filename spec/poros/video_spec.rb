require 'rails_helper'

RSpec.describe Video, type: :model do
  describe 'attributes' do
    it 'has title, video_id, and category attributes' do
      json = { id: '7067',
                 type: 'video',
                 attributes: { id: 7067, video_id: 'b6IFkfSj4Jo',
                               title: '20 Minute Relaxation Yoga',
                               description: 'Relaxing and fun!',
                               tumbnail_url: 'http://thumbail_example.com',
                               category: 'yoga' } }

      video = Video.new(json)
      expect(video.title).to eq('20 Minute Relaxation Yoga')
      expect(video.video_id).to eq('b6IFkfSj4Jo')
      expect(video.category).to eq('yoga')
    end
  end
end
