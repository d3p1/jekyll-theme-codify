##
# @description Jekyll theme image
# @author      C. M. de Picciotto <d3p1@d3p1.dev> (https://d3p1.dev/)
# @note        For some reason, it is not possible to add the following `CMD`
#              to this image: 
#              `CMD ["bundle", "exec", "jekyll", "build", "--watch"]`.
#              The following error is dispatched:
#              `[2023-09-18T05:26:33.196Z] Shell server terminated 
#               (code: 126, signal: null)
#               OCI runtime exec failed: exec failed: unable to start 
#               container process: error executing setns process: 
#               exit status 1: unknown`.
#              This command is added in the dev container configuration
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