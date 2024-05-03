# Climate-NetCDFtoCSV
This repository contains instructions for downloading climate data in NetCDF format, clipping to region of interest and conversion of the data to CSV format.

1. Data download in NetCDF format (ex.CHIRPS for precipitation): https://data.chc.ucsb.edu/products/CHIRPS-2.0/ <br>
2. Clip the NetCDF file to region of interest using the CDO (<a href = https://code.mpimet.mpg.de/projects/cdo/wiki/Tutorial>Climate Data Operator</a>) command line tool
   - For Linux/Mac users, CDO download is straightforward (https://www.isimip.org/protocol/preparing-simulation-files/cdo-help/).
   - For Windows users, CDO can be installed from <a href= https://cygwin.com/>cygwin</a>

After clicking the cygwin install option the following screen should appear

<img width="392" alt="cygwin_1" src="https://github.com/WCT-Riverine-Ecology-And-Livelihoods/Climate-NetCDFtoCSV/assets/95229677/c477b827-e689-425b-bfcd-c72ed3e7d522">

Go through all the the default options till you come to the window for selecting packages

<img width="960" alt="cyg_3" src="https://github.com/WCT-Riverine-Ecology-And-Livelihoods/Climate-NetCDFtoCSV/assets/95229677/688ba747-a0ad-4e5a-a881-4d2c2fcb76f3">

Type 'cdo' in the searchbar and choose: 'cdo' and 'libcdo0' 

<img width="960" alt="cyg_4" src="https://github.com/WCT-Riverine-Ecology-And-Livelihoods/Climate-NetCDFtoCSV/assets/95229677/a081a4d7-a0ef-42c3-9a95-d5d43867d8f6">

Choose version number for 'cdo' and 'libcdo0' and click 'Next' to finish installation 

From the cygwin terminal, give the following commands for clipping the Netcdf file <br> 
(for ex. clipping to region between 72 and 98 E and 20 and 32 N)<br>
`cd /cygdrive/file location ` <br>
`cdo -sellonlatbox,72,98,20,32 <input file.nc> <output file.nc>`

3. Using the clipped files from above, run the example R script (based on <a href=https://github.com/BraeuNerd/ncdfwithRexample/blob/main/ncdfwithRexample.R>this</a> script) to convert to csv format



