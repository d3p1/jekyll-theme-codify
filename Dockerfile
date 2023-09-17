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