##
# @description Jekyll theme image
# @author      C. M. de Picciotto <d3p1@d3p1.dev> (https://d3p1.dev/)
##

##
# @link https://github.com/d3p1/docker-jekyll
##
FROM d3p1/jekyll:nginx-alpine3.18  
    ##
    # @note Install Git for development purpose
    # @note It is necessary to install `openssh`, needed to interact with
    #       Git repositories by SSH
    ##
    RUN apk --no-cache add git
    RUN apk --no-cache add openssh

    ##
    # @note Install Node.js for development purpose
    ##
    RUN apk --no-cache add nodejs npm

    ##
    # @note It is re-used the base image entrypoint.
    #       If it is not defined an entrypoint, 
    #       the following error is dispatched when `CMD` is declared:
    #       `Shell server terminated (code: 126, signal: null)
    #        OCI runtime exec failed: exec failed: unable to start 
    #        container process: error executing setns process: 
    #        exit status 1: unknown`
    ##
    ENTRYPOINT ["/main.docker-entrypoint.sh"]
    CMD ["bundle", "exec", "jekyll", "build", "--watch", "--config=_config.yml,_config.env.yml"]