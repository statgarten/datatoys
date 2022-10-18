#!/usr/bin/env bash
export PGPASSWORD=passwd
for YEAR in {2020..2020}
  do
  for TABLE in SIDO_BORDERS SGG_BORDERS
  do
    FILENAME="${TABLE}_${YEAR}"

    psql -d gis --user=username -h 0.0.0.0 -p 5432 -c \
    "SELECT  \
      json_build_object( \
        'type',  \
        'FeatureCollection',  \
        'features',  \
        json_agg( \
          ST_AsGeoJSON(t.*):: json \
        ) \
      )  \
    FROM  \
      ( \
        select  \
          adm_cd as id,  \
          adm_nm as title,  \
          ST_Transform(geometry, 4326) as geometry  \
        from  \
          \"${TABLE}\"  \
        where  \
          year = ${YEAR} \
      ) as t(id, title, geometry);" \
    -to ./raw/${FILENAME}.geojson

    mapshaper ./raw/${FILENAME}.geojson snap -simplify 1% -o ./simplified/${FILENAME}.geojson format=geojson
    mapshaper ./raw/${FILENAME}.geojson snap -classify field=id -simplify 1% -o ./simplified/${FILENAME}.svg id-field=title
  done
done
