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
    # @note We are going to copy the `Gemfile` and `Gemfile.lock` first 
    #       to cache them. If `Gemfile` and `Gemfile.lock` are modified, 
    #       then the layer is invalidated and `bundle install` will be executed
    ##
    WORKDIR /srv/jekyll
    COPY --chown=${USER_UID}:${USER_GID} jekyll-theme-codify.gemspec ./
    COPY --chown=${USER_UID}:${USER_GID} Gemfile ./
    COPY --chown=${USER_UID}:${USER_GID} Gemfile.lock ./
    RUN bundle install
    COPY --chown=${USER_UID}:${USER_GID} . ./