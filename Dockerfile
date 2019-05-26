FROM vanlog/tidyverse:R-3.4.4

MAINTAINER Andrea Melloncelli "andrea.melloncelli@vanlog.it"

# system libraries of general use
RUN apt-get update && apt-get install -y \
    # apt-utils
    sudo \
    pandoc \
    pandoc-citeproc \
    libcairo2-dev \
    libxt-dev \
    libssl-dev \
    libssh2-1-dev \
    libssl1.0.0 \
    libxml2 \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    sqlite 

# basic shiny functionality
RUN R -e "install.packages('knitr', repos='https://cloud.r-project.org/')"
RUN R -e "install.packages(c('shiny', 'rmarkdown','shinydashboard'), repos='https://cloud.r-project.org/')"
RUN R -e "install.packages('DT', repos='https://cloud.r-project.org/')"
RUN R -e "install.packages('shinyWidgets', repos='https://cloud.r-project.org/')"
RUN R -e "devtools::install_github('timelyportfolio/sweetalertR')"
RUN R -e "install.packages('RColorBrewer', repos='https://cloud.r-project.org/')"
RUN R -e "install.packages('plotly', repos='https://cloud.r-project.org/')"
RUN R -e "install.packages('RSQLite', repos='https://cloud.r-project.org/')"


# setup shiny-proxy app
COPY shiny-proxy-conf/Rprofile.site /usr/lib/R/etc/

EXPOSE 3838

CMD ["R"]
