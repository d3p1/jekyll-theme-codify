##
# @description Jekyll theme image
# @author      Cristian Marcelo de Picciotto <d3p1@d3p1.dev>
##

##
# @link https://hub.docker.com/r/jekyll/jekyll/
##
FROM jekyll/minimal:4.0
    ##
    # @note Set working directory and copy related files to build site
    # @note Use `jekyll` as `user:group` as it is used in the base image
    #       for this path
    # @note We are going to copy the `Gemfile` and `Gemfile.lock` first 
    #       to cache them. If `Gemfile` and `Gemfile.lock` are modified, 
    #       then the layer is invalidated and `bundle install` will be executed
    # @link https://github.com/envygeeks/jekyll-docker/blob/master/repos/jekyll/Dockerfile#L148
    ##
    WORKDIR /srv/jekyll
    COPY --chown=jekyll:jekyll jekyll-theme-codify.gemspec ./
    COPY --chown=jekyll:jekyll Gemfile ./
    COPY --chown=jekyll:jekyll Gemfile.lock ./
    RUN bundle install
    COPY --chown=jekyll:jekyll . ./