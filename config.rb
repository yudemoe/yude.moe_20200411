# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end
 activate :minify_css
 activate :minify_javascript
 activate :directory_indexes
 activate :i18n,
 :mount_at_root => :ja

page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

helpers do
  def page_title(page)
    return page.data.title.send(I18n.locale) if
      page.data.title.is_a?(Hash) && page.data.title[I18n.locale]
    return page.data.title if page.data.title
    return "Untitled"
  end
end