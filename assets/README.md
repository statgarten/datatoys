한반도의 행정구역 경계를 SVG, GeoJSON, TopoJSON으로 제공합니다. 행정구역 경계는 [통계청 SGIS 오픈 API](https://sgis.kostat.go.kr/developer/html/main.html)를 통해 수집하였습니다. 2020년(가장 최신) 행정구역 경계를 아래와 같이 제공합니다.

- `./simplified/` 폴더 내에 `mapshaper` CLI 툴을 활용하여 간소화된 행정구역 경계를 `.svg`, `.geojson` 형식으로 제공합니다.
- `./raw/` 폴더 내에 SGIS에서 제공하는 API 결과를 그대로 제공합니다.
- `./scripts/` 폴더 내에 자료를 가져오기 위해 로컬환경에서 사용한 쉘 스크립트가 있습니다.


## Tools

- [PostGIS](https://postgis.net): UTM-K(EPSG:5179) 좌표계로 제공되는 행정구역 경계 정보를 저장하고 이를 WGS84(EPSG:4326) 좌표계로 변환한 후, GeoJSON 포맷으로 쿼리 결과를 저장.

- [mapshaper](https://github.com/mbloch/mapshaper): GeoJSON 포맷으로 저장된 행정구역 경계 정보를 `Visvalingam / weighted area` 방식으로 단순화한 후 TopoJSON, `.shp` 파일로 변환.

