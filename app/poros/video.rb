class Video
  attr_reader :title, :video_id, :category

  def initialize(json_info)
    @title = json_info[:attributes][:title]
    @category = json_info[:attributes][:category]
    @video_id = json_info[:attributes][:video_id]
  end
end
