module MoodResource
  class Video
    attr_reader :video_id, :description, :type, :category

    def initialize(info)
      @video_id = info[:video_id]
      @description = info[:description]
      @category = info[:category]
    end
  end

  def self.get_suggested_videos(mood)
    response = MoodResourceService.new.get_videos(mood)
    json = JSON.parse(response, symbolize_names: true)
    json[:data].map do |key|
      info = { video_id: key[:attributes][:video_id],
               description: key[:attributes][:description],
               category: key[:attributes][:category] }
      Video.new(info)
    end
  end
end
