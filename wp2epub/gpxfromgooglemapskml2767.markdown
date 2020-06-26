 
[GPX from Google Maps KML J Script](https://bakerjd99.wordpress.com/2012/05/16/gpx-from-google-maps-kml-j-script/)
-----------------------------------------------------------------------------------------------------------------

*Posted: 17 May 2012 03:50:01*

In preparation for my Arizona jaunt to watch the May 20^th^ [annular
eclipse](https://eclipse-maps.com/Eclipse-Maps/Gallery/Pages/Annular\_solar\_eclipse\_of\_2012\_May\_20.html)
I spent a few hours on Google Maps selecting locations to visit. Here
are my prime targets.

After selecting targets the next step is to load them onto my “GPS
device.” Currently my GPS device is the [MotionX GPS
iPhone](https://gps.motionx.com/iphone/overview/) app. MotionX can read
GPX files in many ways *but you need
[GPX](https://www.topografix.com/gpx.asp) files not Google Maps
[KML](https://developers.google.com/kml/documentation/) files.*
Converting KML to GPX is a recurring nuisance. I’ve used [online
converters](https://kml2gpx.com/) for this chore but today, after being
annoyed by this problem for the zillionth time, I dashed off a [J
script](https://www.jsoftware.com/jwiki/FrontPage) that transforms Google
Maps KML to GPX. The main verb `gpxfrmapkml` is shown below. The [entire
script is available here](https://www.box.com/s/09dc770e4821500d222b)
and in the files sidebar. Browse to the J Scripts directory. Happy KML
to GPX’ing my friends.

```J
gpxfrmapkml=:3 : 0

NB.*gpxfrmapkml v-- gpx from Google maps kml.
NB.
NB. monad:  clGpx =. gpxfrmapkml clKml
NB.
NB.   NB. download Google map waypoints as kml
NB.   kml=. read 'c:/temp/arizona annular eclipse.kml'
NB.
NB.   NB. convert to gpx and save
NB.   gpx=. gpxfrmapkml kml
NB.   gpx write 'c:/temp/arizona annular eclipse.gpx'  

NB. parse kml form waypoint table
dname=. ;'name' geteletext '<Placemark>' beforestr y
wpt=.   ;'Placemark' geteletext y
wpt=.   ('name' geteletext wpt) ,. <;._1&> ','&,&.> 'coordinates' geteletext wpt
hdr=.   ;:'phototitle longitude latitude'

NB. format gpx header 
gpxstamp=.   'Waypoints: ',(":#wpt),' GPX generated: ',timestamp''
gpxheader=.  '/{{headername}}/',dname,'/{{headerdescription}}/',gpxstamp
gpxheader=.  gpxheader changestr GPXFRKMLHEADER
gpxtrailer=. GPXTRAILER

'idx pkml'=. HTMLVARBPATTERN patpartstr GPXSMUGPLACEMARK
rvarbs=. idx htmlvarbs pkml

NB. all row varibles must exist in data header
assert. *./ rvarbs e. hdr
rows=. (#wpt) # ,: pkml
rows=. ((hdr i. <'phototitle'){"1 wpt) (<a:;(rvarbs i. <'phototitle'){idx)} rows
rows=. ((hdr i. <'latitude'){"1 wpt) (<a:;(rvarbs i. <'latitude'){idx)} rows
rows=. ((hdr i. <'longitude'){"1 wpt) (<a:;(rvarbs i. <'longitude'){idx)} rows

gpxheader,(;rows),gpxtrailer
)
```
