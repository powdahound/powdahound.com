module Jekyll
  class YouTubeVideoTag < Liquid::Tag

    def initialize(tag_name, markup, tokens)
      super

      if markup =~ /(\S.*\s+)/i
        @video_id = $1
      end
    end

    def render(context)
      "<div class=\"video\"><iframe src=\"https://www.youtube.com/embed/#{@video_id}\" frameborder=\"0\" allowfullscreen></iframe></div>"
    end
  end
end

Liquid::Template.register_tag('youtube_video', Jekyll::YouTubeVideoTag)
