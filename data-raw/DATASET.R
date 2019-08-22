## code to prepare `DATASET` dataset goes here
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

