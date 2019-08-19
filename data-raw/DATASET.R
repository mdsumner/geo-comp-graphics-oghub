## code to prepare `DATASET` dataset goes here
minimal_mesh <- silicate::minimal_mesh

loc <- cbind(7 + 37.5/60, 51 + 57.6/60)
buffer <- 9000
library(ceramic)

#munster_elev <- cc_elevation(loc, buffer, zoom = 12)
#munster_imag <- cc_location(loc, buffer, zoom = 14)
#munster_qmesh <- quadmesh::quadmesh(munster_elev, texture = munster_imag, texture_filename = "data-raw/file160c6c1729b3.png")
munster_elev <- readRDS("data-raw/munster_elev.rds")
save(minimal_mesh, munster_elev, file = "data-raw/geo-comp-graphics.Rdata")
