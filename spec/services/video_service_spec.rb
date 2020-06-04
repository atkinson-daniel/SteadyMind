require 'rails_helper'

describe VideoService do
  describe "instance methods" do
    describe "#all_videos" do
      it "returns videos" do
        videos = VideoService.new.all_videos
        expect(videos).to be_a Hash
        video_data = videos[:data].first[:attributes]

        expect(video_data).to have_key :video_id
        expect(video_data).to have_key :category
        expect(video_data).to have_key :thumbnail_url
        expect(video_data).to have_key :title
      end
    end

    describe "#get_suggested_videos" do
      it "returns video based on category" do
        response = VideoService.new.get_suggested_videos('happy')
        expect(response).to be_a Hash
        response_data = response[:data].first[:attributes]

        expect(response_data).to have_key :video_id
        expect(response_data).to have_key :category
        expect(response_data).to have_key :thumbnail_url
        expect(response_data).to have_key :title
      end
    end
  end
end
