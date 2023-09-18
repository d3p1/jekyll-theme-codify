##
# @description Jekyll gems
# @author      C. M. de Picciotto <d3p1@d3p1.dev> (https://d3p1.dev/)
##
# frozen_string_literal: true
source "https://rubygems.org"

##
# @note Add theme gem dependencies
##
gemspec

##
# @note Chirpy theme gems
# @link https://github.com/cotes2020/jekyll-theme-chirpy
## 
group :test do
  gem "html-proofer", "~> 4.4"
end
platforms :mingw, :x64_mingw, :mswin, :jruby do
  gem "tzinfo", ">= 1", "< 3"
  gem "tzinfo-data"
end
gem "wdm", "~> 0.1.1", :platforms => [:mingw, :x64_mingw, :mswin]
gem "http_parser.rb", "~> 0.6.0", :platforms => [:jruby]