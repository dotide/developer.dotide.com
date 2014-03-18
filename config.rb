require 'extensions/sitemap.rb'

activate :sprockets
after_configuration do
  sprockets.append_path(File.join(root, 'vendor/assets/javascripts'))
  sprockets.append_path(File.join(root, 'vendor/assets/stylesheets'))
  sprockets.append_path(File.join(root, 'vendor/assets/components'))
  sprockets.import_asset('modernizr')
end

###
# Compass
###

# Susy grids in Compass
# First: gem install susy
# require 'susy'

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# With no layout
page "robots.txt", :layout => false
page "humans.txt", :layout => false
page "index.html", :layout => false
page "404.html", :layout => false

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :en do
#   page "/en/*"
# end

with_layout :cn do
  page "/cn/*"
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

# Generate sitemap after build
activate :sitemap_generator

# set :css_dir, 'stylesheets'

# set :js_dir, 'javascripts'

# set :images_dir, 'images'

###
# Syntax
###
activate :syntax

set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true, :tables => true

set :haml, { ugly: true }

# Livereload
activate :livereload

###
# Deploy
###
activate :deploy do |deploy|
  deploy.method   = :ftp
  deploy.host     = "v0.ftp.upyun.com"
  deploy.user     = 'cms-admin/dotide-developer'
  deploy.password = ENV['password']
  deploy.path     = "/"
  deploy.build_before = true
end

# Compressing Images
activate :imageoptim do |options|
  options.pngout_options = false
end

# Build-specific configuration
configure :build do

  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end
