module LawArticlesHelper
  def format_article_content(article)
    content = article.content
    offset  = 0

    article.amendments.order('position asc').each_with_index do |amendment, index|
      amendment_link  = "<a href=\"#\" class=\"amendment\" data-amendmentId=\"#{index}\">#{amendment.initial_text}</a>"
      position        = amendment.position + offset

      # FIXME : doesn't work with the offset :/
      # content.sub!(/(?<=\A.{#{position}})#{amendment.initial_text}/, amendment_link)
      content.sub!(amendment.initial_text, amendment_link)
      offset += amendment_link.size - amendment.initial_text.size
    end

    simple_format(content, {}, {sanitize: false})
  end
end
