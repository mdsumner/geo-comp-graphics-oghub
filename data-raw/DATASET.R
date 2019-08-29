f <- "https://eoimages.gsfc.nasa.gov/images/imagerecords/73000/73909/world.topo.bathy.200412.3x5400x2700.png"
lfile <- file.path("data-raw", basename(f))
if (!file.exists(lfile)) download.file(f, lfile, mode = "wb")
library(raster)
bluemarble0 <- aggregate(setExtent(brick(lfile), extent(-180, 180, -90, 90)), fact = 5, fun = function(x, na.rm = TRUE)x[1])
projection(bluemarble0) <- "+init=epsg:4326"

two_polys <- silicate::minimal_mesh
mesh_polys <- anglr::as.mesh3d(anglr::TRI(two_polys))
delaunay_polys <- anglr::as.mesh3d(anglr::DEL(two_polys))

world_topo <- raster::aggregate(raadtools::readtopo("etopo2"), fact = 20)
world_mesh <- quadmesh::quadmesh(world_topo)

save(two_polys, mesh_polys, delaunay_polys, world_topo, world_mesh, bluemarble0,
     file = "data-raw/geo-comp-graphics.Rdata", version = 2)

# loc <- cbind(7 + 37.5/60, 51 + 57.6/60)
# buffer <- 9000
# library(ceramic)

#munster_elev <- cc_elevation(loc, buffer, zoom = 12)
#munster_imag <- cc_location(loc, buffer, zoom = 14)
#munster_qmesh <- quadmesh::quadmesh(munster_elev, texture = munster_imag, texture_filename = "data-raw/file160c6c1729b3.png")
#munster_elev <- readRDS("data-raw/munster_elev.rds")
#save(minimal_mesh, munster_elev, file = "data-raw/geo-comp-graphics.Rdata")

