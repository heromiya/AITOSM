#! /bin/bash

export LONMIN=`ogrinfo extent/BAN.gml -al -summary | grep Extent | sed -e 's/Extent: (\([0-9.]*\), \([0-9.]*\)) - (\([0-9.]*\), \([0-9.]*\))/\1/'`
export LATMIN=`ogrinfo extent/BAN.gml -al -summary | grep Extent | sed -e 's/Extent: (\([0-9.]*\), \([0-9.]*\)) - (\([0-9.]*\), \([0-9.]*\))/\2/'`
export LONMAX=`ogrinfo extent/BAN.gml -al -summary | grep Extent | sed -e 's/Extent: (\([0-9.]*\), \([0-9.]*\)) - (\([0-9.]*\), \([0-9.]*\))/\3/'`
export LATMAX=`ogrinfo extent/BAN.gml -al -summary | grep Extent | sed -e 's/Extent: (\([0-9.]*\), \([0-9.]*\)) - (\([0-9.]*\), \([0-9.]*\))/\4/'`

export ZLEVEL=18

export EPSG4326="+proj=longlat +datum=WGS84 +no_defs"
export EPSG3857="+proj=merc +a=6378137 +b=6378137 +lat_ts=0.0 +lon_0=0.0 +x_0=0.0 +y_0=0 +k=1.0 +units=m +nadgrids=@null +wktext  +no_defs"
export WIDTH=256
export HEIGHT=256

nodejs get.GoogleSat.js $LONMIN $LATMIN $LONMAX $LATMAX $ZLEVEL > args.lst

exit 0
