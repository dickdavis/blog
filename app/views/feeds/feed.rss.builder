# encoding: UTF-8

xml.instruct! :xml, version: '1.0'
xml.rss version: '2.0' do
  xml.channel do
    xml.title 'RVDavis.me | Richard Davis'
    xml.author 'Richard Davis'
    xml.description 'US Army Infantry veteran, software engineer, professional.'
    xml.link 'https://rvdavis.me'
    xml.language 'en'

    @articles.each do |article|
      xml.item do
        xml.title article.title
        xml.author 'Richard Davis'
        xml.pubDate article.created_at.to_s(:rfc822)
        xml.link "https://rvdavis.me/articles/#{article.id}"
        xml.guid article.id
        xml.description article.summary
        article.text
      end
    end
  end
end
