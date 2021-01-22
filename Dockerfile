FROM rocker/shiny-verse:latest

# system libraries of general use
## install debian packages
RUN apt-get update -qq && apt-get -y --no-install-recommends install \
    git \ 
    lbzip2 \
    libfftw3-dev \
    libgdal-dev \
    libgeos-dev \
    libgsl0-dev \
    libgl1-mesa-dev \
    libglu1-mesa-dev \
    libhdf4-alt-dev \
    libhdf5-dev \
    libjq-dev \
    libpq-dev \
    libproj-dev \
    libprotobuf-dev \
    libnetcdf-dev \
    libsqlite3-dev \
    libssl-dev \
    libudunits2-dev \
    netcdf-bin \
    postgis \
    protobuf-compiler \
    sqlite3 \
    tk-dev \
    unixodbc-dev && \
    R -e "install.packages(c('shiny', 'shinycssloaders', 'shinyjs','shinydashboard','leaflet','htmltools','sf','plotly','ncdf4', 'reshape', 'sortable', 'slickR','tinytex','rvest','LakeMetabolizer','rLakeAnalyzer', 'DT','rintrojs', 'ggpubr'))" && \
    R -e "remotes::install_github('yonicd/slickR')"

RUN cd /srv/shiny-server/ && \
    sudo git clone https://github.com/MacrosystemsEDDIE/module5.git
