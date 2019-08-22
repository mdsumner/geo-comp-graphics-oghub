
two_polys <- silicate::minimal_mesh
mesh_polys <- anglr::as.mesh3d(anglr::TRI(two_polys))
delaunay_polys <- anglr::as.mesh3d(anglr::DEL(two_polys))
library(lazyraster)
td <- normalizePath("~")
my_data_dir <- file.path(td, "data-library")
raadfiles::set_raad_data_roots(my_data_dir, replace_existing = TRUE)
raadtools::set_data_roots(my_data_dir)

world_topo <- raster::aggregate(raadtools::readtopo("etopo2"), fact = 20)
world_mesh <- quadmesh::quadmesh(world_topo)

save(two_polys, mesh_polys, delaunay_polys, world_topo,  file = "data-raw/geo-comp-graphics.Rdata")

loc <- cbind(7 + 37.5/60, 51 + 57.6/60)
buffer <- 9000
library(ceramic)

#munster_elev <- cc_elevation(loc, buffer, zoom = 12)
#munster_imag <- cc_location(loc, buffer, zoom = 14)
#munster_qmesh <- quadmesh::quadmesh(munster_elev, texture = munster_imag, texture_filename = "data-raw/file160c6c1729b3.png")
munster_elev <- readRDS("data-raw/munster_elev.rds")
save(minimal_mesh, munster_elev, file = "data-raw/geo-comp-graphics.Rdata")

