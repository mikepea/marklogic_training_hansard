xquery version "1.0-ml";
(: CREATE CONSTITUENCIES GAZETTEER :)

declare function local:geocode($place as xs:string)
{
let $place-uk := fn:concat($place, ",United Kingdom.")
let $place-uk := fn:replace($place," ","&nbsp;")
let $url := fn:concat('search?q=Speaker-Constituency:"',$place,'"')
let $geocode-rest := concat("http://maps.google.com/maps/geo?q=",$place-uk,"&amp;output=xml")

let $response := 
(xdmp:http-get($geocode-rest,
     <options xmlns="xdmp:http">
     </options>))[2]
     
let $n := ($response//*:LatLonBox/@north)[1]
let $e := ($response//*:LatLonBox/@east)[1]
let $s := ($response//*:LatLonBox/@south)[1]
let $w := ($response//*:LatLonBox/@west)[1]

let $lat := fn:avg(($n, $s))
let $long := fn:avg(($e, $w))

let $count := xdmp:estimate(cts:search(doc(),
    cts:element-value-query(
      xs:QName("Speaker-Constituency"), 
      $place)))

return 
  if ($lat != 0 and $long > -10.7 and $long < 3.0 and $lat > 49.5 and $lat < 60 ) then 
   <location>
      <url>{$url}</url>
      <name>{$place} ({$count})</name>
      <lat>{$lat}</lat>
      <long>{$long}</long>
   </location>
  else ()
};

let $places := cts:element-values(xs:QName("Speaker-Constituency"),"*")
return
let $geocodes := for $p in $places return local:geocode($p)
let $lookup := <locations>{$geocodes}</locations>
return xdmp:document-insert("/content/geocodes.xml", $lookup)
    