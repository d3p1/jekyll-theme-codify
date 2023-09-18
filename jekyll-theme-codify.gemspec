##
# @description Jekyll theme gem spec
# @author      C. M. de Picciotto <d3p1@d3p1.dev> (https://d3p1.dev/)
# @note        This theme is an extension/personalization of the Chirpy theme,
#              that is why it depends on `jekyll-theme-chirpy`
##
# frozen_string_literal: true
Gem::Specification.new do |spec|
  spec.name     = "jekyll-theme-codify"
  spec.version  = "0.0.2"
  spec.authors  = ["Cristian Marcelo de Picciotto"]
  spec.email    = ["d3p1@d3p1.dev"]
  spec.summary  = "A Jekyll theme from a developer to developers"
  spec.homepage = "https://github.com/d3p1/jekyll-theme-codify"
  spec.metadata = {
    "bug_tracker_uri"   => "https://github.com/d3p1/jekyll-theme-codify/issues",
    "documentation_uri" => "https://github.com/d3p1/jekyll-theme-codify/#readme",
    "source_code_uri"   => "https://github.com/d3p1/jekyll-theme-codify",
    "plugin_type"       => "theme"
  }
  spec.license = "MIT"
  spec.files   = `git ls-files -z`.split("\x0").select { 
    |f| f.match(
      %r!^(assets|_data|_layouts|_includes|_sass|LICENSE|README|_config\.yml)!i
    ) 
  }
  spec.add_runtime_dependency "jekyll", "~> 4.3"
  spec.add_runtime_dependency "jekyll-theme-chirpy", "~> 6.1"
end
