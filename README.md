
<!-- README.md is generated from README.Rmd. Please edit that file -->

![](https://github.com/ropensci/dbhydroR/raw/master/inst/images/profile.png)

# Programmatic access to the South Florida Water Management District’s [DBHYDRO database](https://www.sfwmd.gov/science-data/dbhydro)

[![Project Status: Active - The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![R-CMD-check](https://github.com/ropensci/dbhydroR/workflows/R-CMD-check/badge.svg)](https://github.com/ropensci/dbhydroR/actions)
[![CRAN\_Status\_Badge](https://www.r-pkg.org/badges/version/dbhydroR)](https://cran.r-project.org/package=dbhydroR)
[![](https://badges.ropensci.org/61_status.svg)](https://github.com/ropensci/software-review/issues/61)
[![DOI](https://zenodo.org/badge/64503356.svg)](https://zenodo.org/badge/latestdoi/64503356)

`dbhydroR` provides scripted access to the South Florida Water
Management District’s DBHYDRO database which holds over 35 million
hydrologic and water quality records from the Florida Everglades and
surrounding areas.

## Installation

### Stable version from CRAN

`install.packages("dbhydroR")`

### or development version from Github

`install.packages("devtools") # Requires RTools if using Windows`

`devtools::install_github("ropensci/dbhydroR")`

## Usage

### Load dbhydroR

`library("dbhydroR")`

### Water Quality Data

Station IDs and date ranges can be viewed in the [Environmental
Monitoring Location
Maps](https://www.sfwmd.gov/documents-by-tag/emmaps). Test names can be
viewed in the Data Types Metadata Table on the DBHYDRO website.

#### One variable at one station

    get_wq(station_id = "FLAB08", date_min = "2011-03-01", 
          date_max = "2012-05-01", test_name = "CHLOROPHYLL-A, SALINE")

#### One variable at multiple stations

    get_wq(station_id = c("FLAB08","FLAB09"), date_min = "2011-03-01",
          date_max = "2012-05-01", test_name = "CHLOROPHYLL-A, SALINE")

#### One variable at a wildcard station

    get_wq(station_id = c("FLAB0%"), date_min = "2011-03-01", 
          date_max = "2012-05-01", test_name = "CHLOROPHYLL-A, SALINE")

#### Multiple variables at multiple stations

    get_wq(station_id = c("FLAB08","FLAB09"), date_min = "2011-03-01",
          date_max = "2012-05-01", test_name = c("CHLOROPHYLL-A, SALINE",
          "SALINITY"))

#### Operate on raw data

    raw_data <- get_wq(station_id = "FLAB08", date_min = "2011-03-01", 
          date_max = "2012-05-01", test_name = "CHLOROPHYLL-A, SALINE", raw = TRUE)

    clean_wq(raw_data)

### Hydrologic data

Station IDs and date ranges can be viewed in the [Environmental
Monitoring Location
Maps](https://www.sfwmd.gov/documents-by-tag/emmaps).

#### Identify unique time series (dbkeys) before-hand

    get_dbkey(stationid = "C111%", stat = 'MEAN', category = "WQ", detail.level = "full")
    get_hydro(dbkey = 38104, date_min = "2009-01-01", date_max = "2009-01-12")

#### Pass station info on-the-fly

    get_hydro(date_min = "2013-01-01", date_max = "2013-02-02",
             stationid = "JBTS", category = "WEATHER", param = "WNDS",
             freq = "DA", stat = "MEAN", recorder = "CR10", agency = "WMD")

#### Operate on raw data

    raw_data <- get_hydro(date_min = "2013-01-01", date_max = "2013-02-02",
             stationid = "JBTS", category = "WEATHER", param = "WNDS",
             freq = "DA", stat = "MEAN", recorder = "CR10", agency = "WMD", raw = TRUE)
             
    clean_hydro(raw_data)

## References

`vignette("dbhydroR", package = "dbhydroR")`

[DBHYDRO User’s
Guide](https://www.sfwmd.gov/sites/default/files/documents/dbhydrobrowseruserdocumentation.pdf)

## Meta

-   Please [report any issues or
    bugs](https://github.com/ropensci/dbhydroR/issues).

-   Get citation information for `dbhydroR` in R by running
    `citation(package = 'dbhydroR')`

-   Please note that this project is released with a [Contributor Code
    of
    Conduct](https://github.com/ropensci/dbhydroR/blob/master/CONDUCT.md).
    By participating in this project you agree to abide by its terms

[![ropensci\_footer](https://ropensci.org/public_images/github_footer.png)](https://ropensci.org)
