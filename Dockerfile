FROM rails:onbuild
MAINTAINER Pierre-Yves Poujade <py@poujade.org>
RUN mv config/database.yml.example config/database.yml
RUN mv config/secrets.yml.example config/secrets.yml
ENV DB_HOSTNAME pw-db
ENV DOCKERIZED true
ENV RAILS_ENV production
ENV SECRET_KEY_BASE $(rake secret)
CMD rake db:create db:migrate assets:precompile &&\
    rails s
