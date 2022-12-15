## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

library(dplyr)
original <- options("tibble.width")
options(tibble.width = Inf)

## ----setup, include = FALSE---------------------------------------------------
library(ORFID)

## ----field names, eval = TRUE-------------------------------------------------
field_names()

## ----load data, eval = FALSE--------------------------------------------------
#  dat <- import_ORFID(file = "~/reader_1.txt", delim = "\t")
#  events <- import_ORFID_events(file = "~/reader_1.txt", delim = "\t")
#  old_dat <- import_old_readers(file = "~/old_reader.txt", delim = "\t")

## ----join, eval = FALSE-------------------------------------------------------
#  reader_1 <- import_ORFID(file = "reader_1.txt", delim = "\t")
#  reader_2 <- import_ORFID(file = "reader_2.txt", delim = "\t")
#  reader_3 <- import_ORFID(file = "reader_3.txt", delim = "\t")

## ----join2, eval = TRUE-------------------------------------------------------
dat_multi <- join_multireader_data(list(reader_1, reader_2, reader_3))

## ----summarize, eval = TRUE---------------------------------------------------
site_summary(dat_multi)

## ----summarize2, eval = TRUE--------------------------------------------------
tag_summary(dat_multi)

## ----marker, eval = TRUE------------------------------------------------------
marker_tag(dat_multi, tag = "0000_000000005972")

## ----marker2, eval = TRUE, fig.width = 6, fig.heigh = 5-----------------------
marker_tag_plot(dat_multi, tag = "0000_000000005972", gap = 60*10) # Ten minute time gap

## ----direction, eval = TRUE---------------------------------------------------
dat_multi <- join_multireader_data(list(reader_us, reader_ds), verbose = FALSE)

## ----direction2, eval = TRUE--------------------------------------------------
tag_direction(dat_multi, LOC_vec = c("downstream_A1", "upstream_A1")) %>% 
    filter(TAG == "900_228000369764")

## ----direction_summary, eval = TRUE-------------------------------------------
dir <- tag_direction(dat_multi, LOC_vec = c("downstream_A1", "upstream_A1"))

## ----direction_summary2, eval = TRUE------------------------------------------
direction_summary(dir)

direction_summary(dir, include_stationary = TRUE)

## ----efficiency, eval = TRUE--------------------------------------------------
ant_efficiency(dat_multi, LOC_vec = c("downstream_A1", "upstream_A1"))

## ----export, eval = FALSE-----------------------------------------------------
#  export_ORFID(dat_multi, name = "multi_data_compiled", extension = ".xlsx")

## ---- include = FALSE---------------------------------------------------------
options(tibble.width = original)

