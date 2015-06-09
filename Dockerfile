FROM rails:onbuild
MAINTAINER Pierre-Yves Poujade <py@poujade.org>
ENV DB_HOSTNAME pw-db
ENV DOCKERIZED true
ENV RAILS_ENV production
ENV SECRET_KEY_BASE $(rake secret)
RUN if [ -f "config/database.yml" ]; then\
      echo "INFO: using custom config/database.yml";\
    else\
      mv config/database.yml.example config/database.yml;\
    fi &&\

    if [ -f "config/secrets.yml" ]; then\
      echo "INFO: using custom config/secrets.yml";\
    else\
      mv config/secrets.yml.example config/secrets.yml;\
    fi
CMD rake db:create db:migrate assets:precompile &&\
    rails s -b 0.0.0.0
