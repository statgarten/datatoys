
<!-- README.md is generated from README.Rmd. Please edit that file -->

# datatoys <img src="man/figures/logo.png" align="right" width="120" />

## Overview

> Play gives children a chance to practice what they are learning - Fred
> Rogers

Let’s play with data! We prepared toy data for data newbies. This
package contains some datasets provided by the [Public Data
Portal](https://data.go.kr) in Republic of Korea. It makes you can play
with data for fun like children! Install the package, and **start your
adventure!**

우리 데이터로 놀아볼까요?! 여기 시작하는 사람들을 위한 재밌는 데이터가
있습니다. 이 패키지에는 공공데이터포털, 통계청 등에서 제공하는 재밌는
데이터셋이 포함되어 있습니다. 우리 삶에 닿아 있는 데이터를 다루다 보면
데이터 분석에 재미를 느끼게 될거에요. 패키지를 설치하고 모험을 시작해
보세요!

## Installation

    # Install development version from GitHub
    # install.packages("remotes")
    remotes::install_github("statgarten/datatoys")

## For python users

Let’s play with datatoys in
[python](https://github.com/statgarten/datatoys-python). You can easily
load datatoys into a `pandas.DataFrame` format.

    # Install from pip
    pip install datatoys

## A list of datasets

A total 57 datasets are available (Last check point: 2023-08-10
10:54:41).

| 번호 | 데이터셋              | 출처                   | 설명                                             |
|-----:|:----------------------|:-----------------------|:-------------------------------------------------|
|    1 | accident              | 도로교통공단           | 사망교통사고 정보                                |
|    2 | airport               | 국토교통부             | 전세계 공항정보                                  |
|    3 | artmuseum (Artmuseum) | 서울특별시             | 서울시립미술관 소장품 정보                       |
|    4 | bike                  | 서울특별시             | 자전거편의시설                                   |
|    5 | birthRate             | 통계청                 | 시도/인구동태건수 및 동태율(출생,사망,혼인,이혼) |
|    6 | bloodTest             | 국민건강보험공단       | 2014-15 혈액검사 데이터                          |
|    7 | budget2023            | 기획재정부             | 연도별 세출 및 지출 예산현황                     |
|    8 | busStation            | 국토교통부             | 전국 버스 정류장 위치정보                        |
|    9 | busyMetro             | 서울교통공사           | 지하철혼잡도정보                                 |
|   10 | carInspection         | 한국교통안전공단       | 자동차검사소 정보                                |
|   11 | cheerUp               | 서울특별시             | 사회적 약자를 위한 위로의 글                     |
|   12 | childAbuse            | 보건복지부             | 아동학대 신고정보                                |
|   13 | cinema                | 서울특별시             | 영화관상영관인허가정보                           |
|   14 | coolCenter            | 서울특별시             | 무더위쉼터 현황                                  |
|   15 | crime                 | 경찰청                 | 범죄 발생 지역별 통계                            |
|   16 | crimePlace            | 경찰청                 | 범죄 발생 장소별 통계                            |
|   17 | drunkdrive            | 경찰청                 | 음주운전 적발 기록 현황                          |
|   18 | earthShelter          | 서울특별시             | 지진실내구호소 현황                              |
|   19 | election2020          | 중앙선거관리위원회     | 국회의원선거 개표결과 정보                       |
|   20 | elevator              | 한국승강기안전공단     | 국내 승강기 보유 현황                            |
|   21 | farmGIS               | 행전안전부             | 가축사육업 로컬데이터                            |
|   22 | fire                  | 소방청                 | 화재통계                                         |
|   23 | fireStation           | 소방청                 | 전국 소방서 정보                                 |
|   24 | foodBank              | 한국사회복지협의회     | 2021 전국푸드뱅크 기부자 통계                    |
|   25 | foodNutrients         | 식품의약품안전처       | 식품영양성분 데이터베이스                        |
|   26 | gasStation            | 산업통상자원부         | 전국 주유소 등록현황                             |
|   27 | globalBusiness        | 대한무역투자진흥공사   | 해외진출기업 정보                                |
|   28 | gyeonggiER            | 경기도                 | 응급의료기관 및 응급의료지원센터 현황            |
|   29 | hospitalInfo          | 건강보험심사평가원     | 병의원 기본정보                                  |
|   30 | housingPrice          | 국토교통부             | 2021 공동주택 공시가격 정보                      |
|   31 | karaoke               | 행정안전부             | 단란주점 영업 정보                               |
|   32 | Kcalendar             | 한국천문연구원         | 특일 정보                                        |
|   33 | legalDong             | 국토교통부             | 법정동 정보                                      |
|   34 | liquor                | 보건복지부             | 주류관련 통계                                    |
|   35 | medicalCheckup        | 국민건강보험           | 일반건강검진결과                                 |
|   36 | medicine              | 건강보험심사평가원     | 의약품 주성분 정보                               |
|   37 | nationalPension       | 국민연금공단           | 국민연금사업장 정보                              |
|   38 | necessariesPrice      | 한국소비자원           | 생필품가격 정보                                  |
|   39 | odaIndex              | 한국국제협력단         | 협력국 개발지표 및 ODA 지원 실적                 |
|   40 | odaKR                 | 한국국제협력단         | 소득수준별 ODA 실적통계                          |
|   41 | odaNews               | 한국국제협력단         | 국가별 개발협력동향정보                          |
|   42 | openData              | 공공데이터활용지원센터 | 공공데이터포털 목록개방현황                      |
|   43 | petNames              | 마포구                 | 반려동물 이름 통계                               |
|   44 | pharmacyInfo          | 건강보험심사평가원     | 약국 기본정보                                    |
|   45 | pollution             | 국립환경과학원         | 축산오염원조사정보                               |
|   46 | population            | 통계청                 | 인구총조사                                       |
|   47 | postOffice            | 서울특별시             | 우체국 정보                                      |
|   48 | restaurant            | 경기도                 | 맛집 정보                                        |
|   49 | scholarship           | 한국장학재단           | 2020년도 장학금 수혜현황                         |
|   50 | seoulCivic            | 서울특별시             | 2022년 서울 시민생활 데이터                      |
|   51 | seoulCulture          | 서울특별시             | 문화공간정보                                     |
|   52 | seoulER               | 서울특별시             | 응급실 위치 정보                                 |
|   53 | seoulLibrary          | 서울특별시             | 공공도서관 현황정보                              |
|   54 | socialCenter          | 서울특별시             | 사회복지시설 정보                                |
|   55 | tuition               | 한국장학재단           | 장학금 정보                                      |
|   56 | warmingCenter         | 서울특별시             | 한파쉼터현황                                     |
|   57 | weather2020           | 농림축산식품부         | 농업 종관기상 데이터                             |
