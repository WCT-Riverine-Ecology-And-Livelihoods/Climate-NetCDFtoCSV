library(ncdf4)
library(dplyr)
library(stringr)

##Function for NetCDF to csv conversion
nctocsv <- function(filename){
  nc_df <- nc_open(filename) # open the netcdf file
  lat <- ncvar_get(nc_df, "latitude") #ncvar_get to get variables from the nc data
  lon <- ncvar_get(nc_df, "longitude")
  date <- as.Date(ncvar_get(nc_df, "time"), origin = "1980-01-01")
  precip_array <- ncvar_get(nc_df, "precip")
  fillvalue <- ncatt_get(nc_df, "precip", "_FillValue") #ncatt_get to get the attributes
  precip_array[precip_array == fillvalue$value] <- NA 
  precip_long <- as.vector(precip_array) ##convert array to vector
  
  ##creating matrix of all combinations of 'lon', 'lat' and 'date'
  lonlatdate <- as.matrix(expand.grid(lon, lat, date))
  
  #create dataframe
  chirps_df <- data.frame(cbind(lonlatdate, precip_long))
  colnames(chirps_df) <- c("lon", "lat", "date", "precip")
  year <- stringr::str_sub(filename, -7, -4)
  write.csv(chirps_df, file = paste0("chirps_pentad_gbm_", year, ".csv"), row.names = T)
}

##Automate for all files in the list
all_chirps_files <- list.files("Data/To_process", pattern = "*.nc",
                               full.names = TRUE)
lapply(all_chirps_files,
       FUN = nctocsv)

# Working with climate data directly using the climateR library 
# library(climateR)
# library(sf)
# ind_outline <- st_read("Data/India_Updated_Boundary_5May_2020.shp")
# data <- getCHIRPS( #chirps data for 10 days
#   AOI = ,
#   varname = NULL,
#   timeRes = "daily",
#   startDate = "2010-01-01",
#   endDate = "2010-01-11",
#   verbose = FALSE,
#   ID = NULL,
#   dryrun = FALSE
# )