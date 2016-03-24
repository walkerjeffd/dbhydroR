context("gethydro")

test_that("gethydro works", {
  skip_on_cran()
  skip_on_travis()
  skip_on_appveyor()
  
  expect_is(gethydro(dbkey = "15081", date_min = "2013-01-01", date_max = "2013-02-02"), "data.frame")
  
})

test_that("gethydro fails well", {
  skip_on_cran()
  skip_on_travis()
  skip_on_appveyor()
  
  expect_error(gethydro(dbkey = "15081", date_min = "1980-01-01", date_max = "1980-02-02"), "No data found")
  
})

test_that("non-character dates are handled", {
  skip_on_cran()
  skip_on_travis()
  skip_on_appveyor()
  
  expect_error(gethydro(dbkey = "15081", date_min = 1980-01-01, date_max = "1980-02-02"), "Enter dates as quote-wrapped character strings in YYYY-MM-DD format")
  
})