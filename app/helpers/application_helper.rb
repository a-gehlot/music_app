module ApplicationHelper
    def auth_token
        "<input type=hidden name=authenticity_token value=#{form_authenticity_token}/>".html_safe
    end

    def ugly_lyrics(lyrics)
        final_lyrics = ""
        lyrics.lines.each do |line|
            final_lyrics << "&#9835; #{h(line)}"
        end
        "<pre>#{final_lyrics}</pre>".html_safe
    end
end
