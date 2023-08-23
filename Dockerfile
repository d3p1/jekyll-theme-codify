##
# @description Jekyll theme image
# @author      Cristian Marcelo de Picciotto <d3p1@d3p1.dev>
##

##
# @link https://hub.docker.com/r/jekyll/jekyll/
##
FROM jekyll/minimal:4.0
    ##
    # @note This Jekyll image only has the `root` user 
    #       as an available shell user. 
    #       There is a `jekyll` user but it does not have shell access.
    #       This `jekyll` user must be the owner of the source code.
    #       It is necessary to re-create this `jekyll` user 
    #       to be able to develop/work with the site code 
    #       without using the `root` user.
    #       Using the `root` user causes inconveniences related to
    #       file permissions when it is worked with the source code
    #       (i.e. files are created using `root:root`)
    # @see  <project_root_dir>/.devcontainer.json
    # @link https://github.com/envygeeks/jekyll-docker/blob/master/repos/jekyll/Dockerfile#L148
    ##
    ARG USER_UID=1000
    ARG USER_GID=$USER_UID
    RUN deluser jekyll
    RUN groupadd --gid ${USER_GID} jekyll
    RUN useradd --uid ${USER_UID} --gid ${USER_GID} -m jekyll
  
    ##
    # @note It is necessary to install `openssh`, needed to interact with
    #       Git repositories by SSH
    ##
    RUN apk --no-cache add openssh

    ##
    # @note Set working directory and copy related files to build site
    # @note We are going to copy the `Gemfile` and `Gemfile.lock` first 
    #       to cache them. If `Gemfile` and `Gemfile.lock` are modified, 
    #       then the layer is invalidated and `bundle install` will be executed
    # @note For some reason, `bundle install` must be run as `root`.
    #       Check and solve related issue to be able to use `jekyll` user
    ##
    WORKDIR /srv/jekyll
    COPY --chown=jekyll:jekyll jekyll-theme-codify.gemspec ./
    COPY --chown=jekyll:jekyll Gemfile ./
    COPY --chown=jekyll:jekyll Gemfile.lock ./
    RUN bundle install
    COPY --chown=jekyll:jekyll . ./