###
# Blog settings
###

lang = (Bundler.settings['MM_LANG'] || 'en').to_sym
cname = ({
  en: 'sitex.kz',
  ru: 'ru.sitex.kz'
})[lang]

Time.zone = "Asia/Almaty"

activate :directory_indexes
activate :livereload, :host => "localhost"
activate :i18n, langs: [lang]
activate :syntax, :line_numbers => true

# set :build_dir, "build-#{lang}"

activate :blog do |blog|
  blog.permalink = ":year-:month-:day-:title"
  blog.sources = "posts/:title.html"
  blog.layout = "post"
  blog.tag_template = "tag.html"  
  
  # blog.prefix = "blog"
  # blog.taglink = "tags/:tag.html"
  # blog.summary_separator = /(READMORE)/
  # blog.summary_length = 250
  blog.year_link = ":year.html"
  blog.month_link = ":year/:month.html"
  blog.day_link = ":year/:month/:day.html"
  blog.default_extension = ".md"
  # blog.calendar_template = "calendar.html"
  blog.paginate = true
  blog.per_page = 10
  blog.page_link = "page/:num"
end

# Feed
page "/feed.xml", :layout => false

### 
# Compass
###

# Susy grids in Compass
require 'susy'

# Change Compass configuration
# compass_config do |config|
#   config.sass_options = {:debug_info => true}
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
# 
# With no layout
# page "/path/to/file.html", :layout => false
# 
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
# 
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

with_layout :pages do
  page "/pages/*"
end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css
  
  # Minify Javascript on build
  activate :minify_javascript
  
  # Enable cache buster
  # activate :cache_buster
  
  # Use relative URLs
  # activate :relative_assets
  
  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher
  
  # Or use a different image path
  # set :http_path, "/Content/images/"
end

configure :development do
  activate :disqus do |d|
    d.shortname = false
  end
end

configure :build do
  activate :disqus do |d|
    d.shortname = "Sitex Blog"
  end
  ignore 'pages.html'
  # Write CNAME
  IO.write "source/CNAME", cname
end

set :haml, { ugly: true }

set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true
