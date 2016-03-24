context("getdbkey")

test_that("getdbkey fails well", {
  skip_on_cran()
  skip_on_travis()
  skip_on_appveyor()
  
  expect_error(getdbkey(stationid = "S152%", category = "SW") , "No dbkeys found")
  
})

test_that("getdbkey works", {
  skip_on_cran()
  skip_on_travis()
  skip_on_appveyor()
  
  res <- getdbkey(stationid = "C111AE", category = "GW", param = "WELL", freq = "DA", stat = "MEAN", strata = c(9, 22), recorder = "TROL", agency = "WMD", detail.level = "full")
  expect_is(res, "data.frame")
  expect_equal(nrow(res), 1)
  
})
