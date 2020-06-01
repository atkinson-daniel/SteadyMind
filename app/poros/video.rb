class Video
  attr_reader :title, :video_id, :category

  def initialize(info)
    @title = info[:title]
    @category = info[:category]
    @video_id = info[:video_id]
  end
end
