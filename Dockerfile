FROM rocker/tidyverse

RUN mkdir /data

RUN apt-get update

RUN R -e "install.packages('plumber')"

RUN R -e 'install.packages(c("rvest", "polite"))'

COPY ./plumber.R /data

EXPOSE 1030

ENTRYPOINT ["R", "-e", \
    "r = plumber::plumb('/data/plumber.R'); r$run(port = 1030, host = '0.0.0.0')"]

