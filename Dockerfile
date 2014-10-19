FROM rails:onbuild
MAINTAINER Pierre-Yves Poujade <py@poujade.org>
RUN mv config/database.yml.example config/database.yml
ENV DB_HOSTNAME pw-db
ENV DOCKERIZED true
CMD rake db:create db:migrate && rails s
