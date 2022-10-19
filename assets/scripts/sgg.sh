#!/usr/bin/env bash
export PGPASSWORD=passwd
for YEAR in {2020..2020}
  do
  for SD_NAME in \
    서울 경기 부산 광주 세종 \
    충청북도 충청남도 전라남도 전라북도 경상북도\
    경상남도 대구 대전 울산 인천\
    강원 제주
  do 
    TABLE="SGG_BORDERS"
    FILENAME="${SD_NAME}_${YEAR}"

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
          and adm_nm like '${SD_NAME}%' \
      ) as t(id, title, geometry);" \
    -to ./raw/${FILENAME}.geojson

    mapshaper ./raw/${FILENAME}.geojson snap -simplify 30% -o ./simplified/${FILENAME}.geojson format=geojson
    if [ "${SD_NAME}" == "세종" ]; then
      mapshaper ./raw/${FILENAME}.geojson snap -simplify 30% -o ./simplified/${FILENAME}.svg
    else
    mapshaper ./raw/${FILENAME}.geojson snap -classify field=id -simplify 30% -o ./simplified/${FILENAME}.svg id-field=title
    fi
  done
done
