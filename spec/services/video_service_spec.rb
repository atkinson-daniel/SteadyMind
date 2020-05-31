require 'rails_helper'

describe VideoService do
  describe "instance methods" do
    describe "#get_videos" do
      it "returns video based on category" do
        json_response = File.read('spec/fixtures/yoga_video.json')
        stub_request(:get, "https://localhost:3000/api/v1/videos/find_all?category=yoga").
          to_return(status: 200, body: json_response)

        yoga_videos = VideoService.new.get_videos('yoga')
        expect(yoga_videos).to be_a Hash
        yoga_video_data = yoga_videos[:data].first[:attributes]

        expect(yoga_video_data).to have_key :video_id
        expect(yoga_video_data).to have_key :category
        expect(yoga_video_data).to have_key :description
        expect(yoga_video_data).to have_key :thumbnail_url
        expect(yoga_video_data).to have_key :title
      end
    end
  end
end
