xquery version "1.0";declare namespace xdmp="http://marklogic.com/xdmp";

(: Generated on 2011-05-12 by the MarkLogic Application Builder, v1.0 :)

import module namespace config="http://marklogic.com/appservices/config" at "/lib/config.xqy";

xdmp:set-response-content-type("text/html; charset=utf-8"),
xdmp:apply($config:doctype),
xdmp:apply($config:page)