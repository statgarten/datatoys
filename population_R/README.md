# population_R

국가통계포털의 [통계청,「인구총조사」, 2021, 2023.01.16, 인구,가구 및 주택 – 읍면동(연도 끝자리 0,5), 시군구(그 외 연도)](https://kosis.kr/statHtml/statHtml.do?orgId=101&tblId=DT_1IN1503&conn_path=I2) 등의 데이터를 활용해 패키지를 만듭니다.

[ggplot2](http://aispiration.com/R-ecology-lesson/kr/05-visualization-ggplot2.html)과 [gganimal](https://gganimate.com/)를 통해 데이터 시각화도 진행합니다.

모든 연도를 합치고, 평균 등의 데이터를 삭제하여 활용하기 좋은 데이터셋을 만듭니다.

---

## Pre-processing

- 엑셀파일을 모두 dataframe으로 저장합니다.

- column '행정구역별' 에 value를 채워줍니다.

- df_4의 column 값만 달라서 df_1,df_2,df_3과 동일하게 변경합니다.

- df_4 data 값 변경(이전 data : 행정구역별(읍면동) 변경 후 data : 행정구역별)

- 4개로 나뉜 dataframe을 하나로 결합합니다.

- 이 데이터의 column 값을 명시적으로 바꿔주고, 첫번째 행을 삭제합니다(column과 내용 중복).

- 이 데이터를 엑셀파일로 저장

---

## Data Visualization



### ggplot2, gganimate를 통해 Data Visualization


- [x] 각 연도, 행정구역별 총인구 히스토그램 (ggplot) -> 연도별 행정구역 총인구 히스토그램 애니메이션(gganimate)
  
  
![total_population](https://user-images.githubusercontent.com/86904141/214488927-89211470-8c21-4421-bc45-7fb22f12e4f8.gif)

- 색깔이 많아 가독성이 안 좋고, 어느 지역이 더 많은지 파악하기 힘듦

![total_population_color_ver](https://user-images.githubusercontent.com/86904141/214770781-d29bea28-b888-4f80-926c-2b7c5a8dc95d.gif)

- 위의 그래프를 coord_flip을 통해 전환하고, 년도별 더 많은 인구를 가진 지역이 위로 올라오도록 설정 & 가독성을 높이기위해 지역별로 묶어 비슷한 색깔을 지정

![total_population_onecolor](https://user-images.githubusercontent.com/86904141/214772691-49514a72-3627-47bb-b6bc-24743ba7ccc9.gif)

- 위의 그래프를 단일 색깔로 바꾼 버전
  
- [x] 서울시 각 연도별, 연령대별 인구 변화  히스토그램 (ggplot) -> 연도별 서울시 연령대별 히스토그램 애니메이션 (gganimate)

![seoul_populationpyramid](https://user-images.githubusercontent.com/86904141/215535686-811b6ce2-05b9-42e4-9fb0-2058ec50a84c.gif)

