##
# @description Jekyll theme image
# @author      Cristian Marcelo de Picciotto <d3p1@d3p1.dev>
##

##
# @link https://hub.docker.com/r/jekyll/jekyll/
##
FROM jekyll/minimal:4.0
    ##
    # @note The Jekyll official image only has the `root` user 
    #       as an available shell user. 
    #       There is a `jekyll` user but it does not have shell access.
    #       I think that it is necessary to re-create this `jekyll` user 
    #       to be able to work/access site code without using the `root` user
    ##
    ARG USER_UID=1000
    ARG USER_GID=$USER_UID
    RUN deluser jekyll
    RUN groupadd --gid ${USER_GID} jekyll
    RUN useradd --uid ${USER_UID} --gid ${USER_GID} -m jekyll
    USER ${USER_UID}:${USER_GID}

    ##
    # @note Set working directory and copy related files to build site
    # @note We are going to copy the `Gemfile` and `Gemfile.lock` first 
    #       to cache them. If `Gemfile` and `Gemfile.lock` are modified, 
    #       then the layer is invalidated and `bundle install` will be executed
    ##
    WORKDIR /srv/jekyll
    COPY --chown=${USER_UID}:${USER_GID} Gemfile ./
    COPY --chown=${USER_UID}:${USER_GID} Gemfile.lock ./
    RUN bundle install
    COPY --chown=${USER_UID}:${USER_GID} . ./