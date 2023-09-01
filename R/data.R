#' @importFrom tibble tibble
NULL

#' 서울특별시 대학원 통계 
#' 
#' 서울열린데이터 광장에서 제공하는 대학원의 학생수(석사ㆍ박사과정), 교원수, 졸업/입학자 현황(석사ㆍ박사과정) 등, 출처 : 한국교육개발원 교육통계연구센터 
#'
#' @format A list with 4 data frame.
#' \describe{
#'    \item{구분_1}{대학원수(개), 학과수(개), 입학정원수, 석사과정학생수, 박사과정학생수, 졸업자현황}
#'    \item{구분_2}{소계, 석사과정, 박사과정}
#'    \item{시점}{조사 시점 : 1997 ~ 2022}
#'    \item{수}{조사 시점의 수(대학원의 수, 학과 수, 입학 정원 수 등)}
#'  }
#' @source \url{https://data.seoul.go.kr/dataList/211/C/2/datasetView.do}
#' @examples
#' seoulDoctor <- seoulGraduate %>% 
#'   filter(구분_1 == "박사과정학생수" | 구분_2 == "박사과정")
#' 
#' ggplot(seoulDoctor, aes(x=시점, y=수, color=구분_1, group = 구분_1)) +
#'   geom_point() +
#'   geom_path() +
#'   scale_y_continuous(labels = scales::comma) +  
#'   theme_minimal(base_family = "NanumGothic")+
#'   labs(title="서울시 박사 통계", color = "") + 
#'   theme(plot.title = element_text(hjust = 0.5, size = 22, color = "royalblue4", face = "bold"), legend.position = "top")
"seoulGraduate"

#' 통계청 내국인 출국 연령별
#' 
#' 한국관광공사에서 제공하는 관광수지 및 관광목적의 외래객입국과 내국인출국현황을 파악, 분석하여 관광정책수립의 기초자료로 활용
#'
#' @format A list with 3 data frame.
#' \describe{
#'    \item{연령}{해당 출국객 연령: 0-20세,21-30세,31-40세,41-50세,51-60세,61세 이상}
#'    \item{시점}{해당 출국객 시점: 2014년 1월 ~ 2023년 6월}
#'    \item{출국객 수}{해당 출국객 수}
#'  }
#' @source \url{https://kosis.kr/statHtml/statHtml.do?orgId=314&tblId=DT_TRD_AGE_ENT_AGG_MONTH&vw_cd=MT_ZTITLE&list_id=H2_19&scrId=&seqNo=&lang_mode=ko&obj_var_id=&itm_id=&conn_path=MT_ZTITLE&path=%252FstatisticsList%252FstatisticsListIndex.do}
#' @examples
#' 
#' departure$시점 <- as.Date(paste0(departure$시점, ".1"),format="%Y.%m.%d")
#' View(departure)
#' main_departure <- departure %>% 
#'   group_by(year(시점), 연령별) %>% 
#'   summarize(총출국객 = sum(`출국객 수`)) %>% 
#'   rename(
#'     연도 = `year(시점)`
#'   )
#' 
#' ggplot(main_departure, aes(x=연도, y=총출국객, color=연령별)) +
#'   geom_point() +
#'   geom_line() +
#'   labs(title = "출국객 수", x="시점", y="") +
#'   scale_y_continuous(labels = scales::comma) +  
#'   theme_minimal(base_family = "NanumGothic")+
#'   theme(plot.title = element_text(hjust = 0.5, size = 22, color = "royalblue4", face = "bold"))
"departure"


#' 통계청 외래객 입국-연령별/국적별
#' 
#' 한국관광공사에서 제공하는 관광수지 및 관광목적의 외래객입국과 내국인출국현황을 파악, 분석하여 관광정책수립의 기초자료로 활용
#'
#' @format A list with 5 data frame.
#' \describe{
#'    \item{연령}{해당 외래객 연령: 0-20세,21-30세,31-40세,41-50세,51-60세,61세 이상}
#'    \item{시점}{해당 외래객 시점: 2017년 7월 ~ 2023년 6월}
#'    \item{대륙}{해당 외래객 대륙: 아시아주, 미주, 구주, 대양주, 아프리카}
#'    \item{국가}{해당 외래객 국가}
#'    \item{외래객}{해당 외래객 수}
#'  }
#' @source \url{https://kosis.kr/statHtml/statHtml.do?orgId=314&tblId=DT_TRD_AGE_ENT_AGG_MONTH&vw_cd=MT_ZTITLE&list_id=H2_19&scrId=&seqNo=&lang_mode=ko&obj_var_id=&itm_id=&conn_path=MT_ZTITLE&path=%252FstatisticsList%252FstatisticsListIndex.do}
#' @examples
#' 
#' entrance$시점 <- as.Date(paste0(entrance$시점, ".1"),format="%Y.%m.%d")
#' 
#' main_entrance <- entrance %>% 
#'   group_by(시점, 국가) %>% 
#'   summarize(총외래객 = sum(외래객)) %>% 
#'   filter(국가 == "중국" | 국가 == "홍콩" | 국가 == "일본" | 국가 == "미국" | 국가 == "대만")
#' 
#' ggplot(main_entrance, aes(x=시점, y=총외래객, color=국가)) +
#'   geom_point() +
#'   geom_line() +
#'   labs(title = "주요 국가 별 외래객 수", x="시점", y="") +
#'   scale_y_continuous(labels = scales::comma) +  
#'   theme_minimal(base_family = "NanumGothic")+
#'   theme(plot.title = element_text(hjust = 0.5, size = 22, color = "royalblue4", face = "bold"))
"entrance"

#' 경찰청 전국치안센터주소현황
#' 
#' 경찰청에서 제공하는 전국 치안센터 주소 이용허락범위 제한 없음.
#'
#' @format A list with 6 data frame.
#' \describe{
#'    \item{시도청}{해당 치안센터 시도청 : 서울청,부산청,대구청,인천청,광주청,대전청,울산청,세종청,경기남부청,경기북부청,강원청,충북청,충남청,전북청,전남청,경북청,경남청,제주청}
#'    \item{지역명}{해당 치안센터 지역명}
#'    \item{관서명}{해당 치안센터 관서명}
#'    \item{지파출소}{해당 치안센터 지파출소 : 지구대, 파출소}
#'    \item{치안센터명}{해당 치안센터 치안센터명}
#'    \item{주소}{해당 치안센터 주소}
#'  }
#' @source \url{https://www.data.go.kr/data/15076962/fileData.do}
#' @examples
#' library(extrafont)
#' 
#' policeBox %>% 
#'   group_by(시도청, 지파출소) %>% 
#'   summarise(Count = n()) %>% 
#'   ggplot(aes(x=시도청, y=Count, fill = 지파출소)) +
#'   geom_bar(stat = "identity", position = "dodge") +
#'   labs(title = "지역별 지구대/파출소 수", x = "지역", y = "") +
#'   scale_x_discrete(labels = function(x) gsub("청$", "", x)) +
#'   theme_bw(base_family = "NanumGothic")
#' theme_minimal() +
#'   theme(axis.text.x = element_text(angle = 45, hjust = 1))
"policeBox"

#' 행정안전부 인터넷컴퓨터게임시설제공업 정보
#'
#'  PC방과 같이 컴퓨터 등 게임물을 이용하는데 필요한 기자재를 갖추거나 그 밖의 정보제공물을 이용할 수 있도록 제공하는 업소정보
#' 
#' @format A data frame with 11 variables:
#' \describe{
#'   \item{사업장명}{해당 게임제공업 사업장명}
#'   \item{전화번호}{해당 게임제공업 전화번호}
#'   \item{소재지전체주소}{해당 게임제공업 소재지전체주소}
#'   \item{도로명전체주소}{해당 게임제공업 도로명전체주소}
#'   \item{도로명우편번호}{해당 게임제공업 도로명우편번호}
#'   \item{경도}{해당 게임제공업 경도}
#'   \item{위도}{해당 게임제공업 위도}
#'   \item{총층수}{해당 게임제공업 총층수}
#'   \item{시설면적}{해당 게임제공업 시설면적}
#'   \item{지상층수}{해당 게임제공업 지상층수}
#'   \item{지하층수}{해당 게임제공업 지하층수}
#' }
#' @source \url{https://www.localdata.go.kr/devcenter/dataDown.do?menuNo=20001}
#' @examples
#' library(leaflet)
#' leaflet(pcRoom) %>% 
#'   addTiles() %>% 
#'   setView(lng=126.9784, lat=37.566, zoom=8) %>% 
#'   addProviderTiles('CartoDB.Positron') %>% 
#'   addMarkers(lng=~`경도`, lat=~`위도`,
#'              label =~`사업장명`,
#'              clusterOptions = markerClusterOptions())
"pcRoom"

#' 서울특별시 공중화장실 위치정보
#'
#' 서울시 공중화장실 현황정보를 제공합니다. 좌표정보를 지도위에 표시하여 화장실 위치정보를 제공합니다. 
#' 
#' @format A data frame with 4 variables:
#' \describe{
#'   \item{주소(구)}{해당 화장실 주소(구)}
#'   \item{주소(동)}{해당 화장실 주소(동)}
#'   \item{위도}{해당 화장실 위도}
#'   \item{경도}{해당 화장실 경도}
#' }
#' @source \url{https://data.seoul.go.kr/dataList/OA-1370/S/1/datasetView.do}
#' @examples
#' library(leaflet)
#' leaflet(seoulRestroom) %>% 
#'   addTiles() %>% 
#'   setView(lng=126.9784, lat=37.566, zoom=11) %>% 
#'   addProviderTiles('CartoDB.Positron') %>% 
#'   addCircles(lng=~경도, lat=~위도,
#'              label=~`주소(동)`)
"seoulRestroom"

#' 서울특별시 공영주차장 안내 정보
#'
#' 공영 노상, 노외 주차장 운영 정보를 안내하고 있으며, 주차장 여건에 따라 실제 정보와 다를 수 있습니다.
#' 
#' @format A data frame with 19 variables:
#' \describe{
#'   \item{주차장코드}{해당 주차장 주차장코드}
#'   \item{주차장명}{해당 주차장 주차장명}
#'   \item{주소}{해당 주차장 주소}
#'   \item{주차장종류}{해당 주차장 주차장종류 : 노외주차장/ 노상주차장}
#'   \item{운영구분}{해당 주차장 운영구분 : 시간제 주차장/시간제 + 거주자 주차장/버스전용 주차장/이륜차 전용 주차장/거주자 우선 주차장/시간제 + 버스전용 주차장}
#'   \item{전화번호}{해당 주차장 전화번호}
#'   \item{주차현황제공여부}{해당 주차장 주차현황제공여부}
#'   \item{총 주차 가능 대수}{해당 주차장 총 주차 가능 대수}
#'   \item{유무료구분}{해당 주차장 유무료구분 : 유료/무료}
#'   \item{토요일 유무료 구분}{해당 주차장 토요일 유무료 구분}
#'   \item{공휴일 유무료 구분}{해당 주차장 공휴일 유무료 구분}
#'   \item{월 정기권 금액}{해당 주차장 월 정기권 금액}
#'   \item{기본 주차 요금}{해당 주차장 기본 주차 요금}
#'   \item{기본 주차 단위(분)}{해당 주차장 기본 주차 단위(분)}
#'   \item{추가 주차 요금}{해당 주차장 추가 주차 요금}
#'   \item{추가 주차 단위(분)}{해당 주차장 추가 주차 단위(분)}
#'   \item{일 최대 요금}{해당 주차장 일 최대 요금}
#'   \item{위도}{해당 주차장 위도}
#'   \item{경도}{해당 주차장 경도}
#' }
#' @source \url{https://data.seoul.go.kr/dataList/OA-13122/S/1/datasetView.do}
#' @examples
#' col_fac = colorFactor('Set1', seoulCarpark$운영구분)
#' 
#' library(leaflet)
#' leaflet(seoulCarpark) %>% 
#'   addTiles() %>% 
#'   setView(lng=126.9784, lat=37.566, zoom=11) %>%  
#'   addProviderTiles('CartoDB.Positron') %>% 
#'   addCircles(lng=~`경도`, lat=  ~`위도`,
#'              label =~`주차장명`,
#'              popup =~paste(`주차장명`,"<BR>", "주소 : ",`주소`, sep="","<BR>","운영구분 : ",`운영구분`,"<BR>", "유무료구분 : ",`유무료구분`),
#'              color = ~col_fac(운영구분)) %>% 
#'   addLegend(position = 'bottomright', 
#'             title = '구분', 
#'             pal = col_fac, values = ~운영구분, opacity = 0.5)
"seoulCarpark"

#' 서울특별시 안심이 CCTV 연계 현황
#'
#' 서울시 안심이 CCTV 연계 현황 관련으로 명칭, 주소, 위도/경도(좌표) 등으로 제공합니다. (개방표준 데이터), 안심이앱 : 기존 유사 안전서비스 스마트폰 앱 방식의 긴급호출방법 문제점을 개선한 자치구, 이동통신사와 연동이 가능한 개방형 공통 통합플랫폼 형태의 서울시 여성종합안심앱(안심이) 
#' 
#' @format A data frame with 5 variables:
#' \describe{
#'   \item{자치구}{해당 CCTV 설치 자치구}
#'   \item{주소}{해당 CCTV 설치 주소}
#'   \item{위도}{해당 CCTV 설치 위도}
#'   \item{경도}{해당 CCTV 설치 경도}
#'   \item{수량}{해당 CCTV 설치 수량}
#' }
#' @source \url{https://data.seoul.go.kr/dataList/OA-20923/S/1/datasetView.do}
#' @examples
#' library(leaflet)
#' leaflet(seoulCCTV) %>% 
#'   addTiles() %>% 
#'   setView(lng=126.9784, lat=37.566, zoom=11) %>% 
#'   addProviderTiles('CartoDB.Positron') %>% 
#'   addMarkers(lng=~경도, lat=~위도,
#'              label=~주소,
#'              popup=~paste(주소,"<BR>", "수량 : ", 수량, sep=""),
#'              clusterOptions = markerClusterOptions())
"seoulCCTV"


#' 서울특별시 동상 현황
#'
#' 서울시에서 관리하는 동상 정보입니다. 작품명, 설치연도, 작품설치장소, 작품관리기관, 작품주소, 상세주소, 작품상세 정보를 제공합니다.
#' 
#' @format A data frame with 7 variables:
#' \describe{
#'   \item{작품명}{해당 동상 작품명}
#'   \item{설치연도}{해당 동상 설치연도}
#'   \item{작품설치장소}{해당 동상 작품설치장소}
#'   \item{작품관리기관}{해당 동상 작품관리기관}
#'   \item{작품주소}{해당 동상 작품주소}
#'   \item{상세주소}{해당 동상 상세주소}
#'   \item{작품상세}{해당 동상 작품상세}
#' }
#' @source \url{https://data.seoul.go.kr/dataList/OA-21242/S/1/datasetView.do}
#' @examples
#' DT::datatable(head(seoulStatue, 50))
"seoulStatue"

#' 제주데이터허브 무장애여행정보 제주올레길코스
#' 
#' 제주특별자치도에서 제공하는 무장애여행 관련 관광지별 위도, 경도, 장소명칭, 장소상세정보, 무장애관광정보입니다.
#' 
#' @format A data frame with 6 variables.
#' \describe{
#'    \item{구분}{해당 장소 구분}
#'    \item{위도}{해당 장소 위도}
#'    \item{경도}{해당 장소 경도}
#'    \item{설명}{해당 장소 설명}
#'    \item{상세정보}{해당 장소 상세정보}
#'    \item{코스}{해당 장소 코스 : 1번 코스, 10번 코스, 14번 코스}
#'  }
#' @source \url{https://www.jejudatahub.net/data/view/data/691}
#' @examples
#' course_color = colorFactor('Set1', olleWheelchair$코스)
#' 
#' library(leaflet)
#' leaflet(olleWheelchair) %>% 
#'   addTiles() %>% 
#'   setView(lng=126.4784, lat=33.39282, zoom=10) %>%  
#'   addProviderTiles('CartoDB.Positron') %>% 
#'   addCircles(lng=~`경도`, lat=  ~`위도`,
#'              label =~`구분`,
#'              popup =~paste(`구분`,"<BR>", "설명 : ",`설명`, sep="","<BR>","접근성 : ",`상세정보`),
#'              color = ~course_color(코스)) %>% 
#'   addLegend(position = 'bottomright', 
#'             title = '코스', 
#'             pal = course_color, values = ~코스, opacity = 0.5)
"olleWheelchair"

#' 행정안전부 가축분뇨수집운반업, 배출시설관리업 정보
#' 
#' 가축의 배설물을 수집하여 운반하는 업소정보와 가축분뇨배출시설 및 처리시설의 관리를 대행하는 업소정보, 주소, 번호, 경도, 위도 등을 제공
#' 
#' @format A data frame with 10 variables.
#' \describe{
#'    \item{사업장명}{해당 가축분뇨 처리업 사업장명}
#'    \item{전화번호}{해당 가축분뇨 처리업 전화번호}
#'    \item{소재지우편번호}{해당 가축분뇨 처리업 소재지우편번호}
#'    \item{소재지전체주소}{해당 가축분뇨 처리업 소재지전체주소}
#'    \item{도로명전체주소}{해당 가축분뇨 처리업 도로명전체주소}
#'    \item{도로명우편번호}{해당 가축분뇨 처리업 도로명우편번호}
#'    \item{경도}{해당 가축분뇨 처리업 경도}
#'    \item{위도}{해당 가축분뇨 처리업 위도}
#'    \item{업종구분명}{해당 가축분뇨 처리업 업종구분명 : 지정외 폐기물 수집운반업, 분뇨 및 축산분뇨 처리업, 축산관련 서비스업, 축산분뇨 처리업 등}
#'    \item{구분}{해당 가축분뇨 처리업 구분 : 가축분뇨 수집운반업, 가축분뇨배출시설관리업(사업장)}
#'  }
#' @source \url{https://www.localdata.go.kr/devcenter/dataDown.do?menuNo=20001}
#' @examples
#' col_fac = colorFactor('Set1', aniPollution$구분)
#' 
#' library(leaflet)
#' leaflet(aniPollution) %>% 
#'   addTiles() %>% 
#'   setView(lng=127.9784, lat=36.866, zoom=7) %>%  
#'   addProviderTiles('CartoDB.Positron') %>% 
#'   addCircles(lng=~`경도`, lat=  ~`위도`,
#'              label =~`사업장명`,
#'              popup =~paste(`사업장명`,"<BR>", "주소 : ",`도로명전체주소`, sep="","<BR>","전화번호 : ",`전화번호`),
#'              color = ~col_fac(구분)) %>% 
#'   addLegend(position = 'bottomright', 
#'             title = '구분', 
#'             pal = col_fac, values = ~구분, opacity = 0.5)
"aniPollution"


#' 행정안전부 직업소개소 정보
#' 
#' 유료/무료로 구인 또는 구직의 신청을 받아 구인자와 구직자 간에 고용계약이 성립되도록 알선하는 업소정보, 주소, 번호, 경도, 위도 등을 제공
#' 
#' @format A data frame with 9 variables.
#' \describe{
#'    \item{사업장명}{해당 직업소개소 사업장명}
#'    \item{전화번호}{해당 직업소개소 전화번호}
#'    \item{소재지우편번호}{해당 직업소개소 소재지우편번호}
#'    \item{소재지전체주소}{해당 직업소개소 소재지전체주소}
#'    \item{도로명전체주소}{해당 직업소개소 도로명전체주소}
#'    \item{도로명우편번호}{해당 직업소개소 도로명우편번호}
#'    \item{경도}{해당 직업소개소 경도}
#'    \item{위도}{해당 직업소개소 위도}
#'    \item{유무료}{해당 직업소개소 유무료 여부 : 유료, 무료}
#'  }
#' @source \url{https://www.localdata.go.kr/devcenter/dataDown.do?menuNo=20001}
#' @examples
#' free_color = colorFactor('Set1', jobMating$유무료)
#' 
#' library(leaflet)
#' leaflet(jobMating) %>% 
#'   addTiles() %>% 
#'   setView(lng=127.9784, lat=36.866, zoom=7) %>%  
#'   addProviderTiles('CartoDB.Positron') %>% 
#'   addCircles(lng=~`경도`, lat=  ~`위도`,
#'              label =~`사업장명`,
#'              popup =~paste(`사업장명`,"<BR>", "주소 : ",`도로명전체주소`, sep="","<BR>","전화번호 : ",`전화번호`),
#'              color = ~free_color(유무료)) %>% 
#'   addLegend(position = 'bottomright', 
#'             title = '유무료', 
#'             pal = free_color, values = ~유무료, opacity = 0.5)
"jobMating"

#' 행정안전부 부화업 정보
#' 
#' 닭 또는 오리 등 부화대상 가축의 알을 인공부화시설로 부화시켜 판매하는 업소정보, 주소, 번호, 경도, 위도 등을 제공
#' 
#' @format A data frame with 9 variables.
#' \describe{
#'    \item{사업장명}{해당 부화업 사업장명}
#'    \item{전화번호}{해당 부화업 전화번호}
#'    \item{소재지면적}{해당 부화업 소재지면적}
#'    \item{소재지우편번호}{해당 부화업 소재지우편번호}
#'    \item{소재지전체주소}{해당 부화업 소재지전체주소}
#'    \item{도로명전체주소}{해당 부화업 도로명전체주소}
#'    \item{도로명우편번호}{해당 부화업 도로명우편번호}
#'    \item{경도}{해당 부화업 경도}
#'    \item{위도}{해당 부화업 위도}
#'  }
#' @source \url{https://www.localdata.go.kr/devcenter/dataDown.do?menuNo=20001}
#' @examples
#' library(leaflet)
#' leaflet(hatching) %>% 
#'   addTiles() %>% 
#'   setView(lng=127.9784, lat=35.866, zoom=7) %>%  
#'   addProviderTiles('CartoDB.Positron') %>% 
#'   addCircleMarkers(lng=~`경도`, lat=  ~`위도`,
#'                    label =~`사업장명`,
#'                    popup =~paste(`사업장명`,"<BR>", "주소 : ",`도로명전체주소`, sep="","<BR>","전화번호 : ",`전화번호`))
"hatching"

#' 공공데이터포털 독립운동정보 원문정보
#' 
#' 독립기념관 독립운동정보 원문자료의 자료번호, 자료내용 등의 정보입니다.
#'
#' @format A data frame with 3 variables.
#' \describe{
#'    \item{순번}{독립운동정보 원문자료 순번}
#'    \item{자료번호}{독립운동정보 원문자료 자료번호}
#'    \item{내용}{독립운동정보 원문자료 내용}
#'  }
#' @source \url{https://www.data.go.kr/data/15070349/fileData.do?recommendDataYn=Y#/tab-layer-recommend-data}
#' @examples
#' library(tidytext)
#' library(ggwordcloud)
#' library(stringr)
#' library(ggthemes)
#' imdependenceMov$내용 <- imdependenceMov$내용 %>% 
#'   str_replace_all('[^가-힣]', ' ') %>% 
#'   str_squish()
#' 
#' # mask_png <- png::readPNG("korean-flag-1424985_1280.png")
#' 
#' imdependenceMov %>% 
#'   unnest_tokens(input = 내용, output = word, token = "words") %>% 
#'   count(word, sort = TRUE) %>% 
#'   filter(str_count(word) > 1) %>% 
#'   head(100) %>% 
#'   arrange(-n) %>% 
#'   ggplot(aes(label = word, 
#'              size = n, 
#'              col = as.character(n))) +
#'   geom_text_wordcloud(seed = 1234,
#'                       max_steps = 1,
#'                       grid_size = 1,
#'                       eccentricity = .9,
#'                       family = "NanumGothic") +
#'   scale_size_area(max_size=12) +
#'   theme_minimal()
"imdependenceMov"

#' 행정안전부 산후조리업 정보
#'
#'  출산 이후 임산부 및 신생아의 건강과 위생을 관리하기 위한 시설 정보, 주소, 번호, 경도, 위도, 임산부정원수, 영유아정원수 등을 제공
#' 
#' @format A data frame with 27 variables:
#' \describe{
#'   \item{사업장명}{해당 산후조리업 사업장명}
#'   \item{전화번호}{해당 산후조리업 전화번호}
#'   \item{소재지우편번호}{해당 산후조리업 소재지우편번호}
#'   \item{소재지전체주소}{해당 산후조리업 소재지전체주소}
#'   \item{도로명전체주소}{해당 산후조리업 도로명전체주소}
#'   \item{도로명우편번호}{해당 산후조리업 도로명우편번호}
#'   \item{경도}{해당 산후조리업 경도}
#'   \item{위도}{해당 산후조리업 위도}
#'   \item{임산부정원수}{해당 산후조리업 임산부정원수}
#'   \item{영유아정원수}{해당 산후조리업 영유아정원수}
#'   \item{임산부실면적}{해당 산후조리업 임산부실면적}
#'   \item{영유아실면적}{해당 산후조리업 영유아실면적}
#'   \item{모유수유실면적}{해당 산후조리업 모유수유실면적}
#'   \item{급식시설면적}{해당 산후조리업 급식시설면적}
#'   \item{세탁실면적}{해당 산후조리업 세탁실면적}
#'   \item{목욕실면적}{해당 산후조리업 목욕실면적}
#'   \item{조리원화장실면적}{해당 산후조리업 조리원화장실면적}
#'   \item{사무실면적}{해당 산후조리업 사무실면적}
#'   \item{간호사수}{해당 산후조리업 간호사수}
#'   \item{간호조무사수}{해당 산후조리업 간호조무사수}
#'   \item{영양사수}{해당 산후조리업 영양사수}
#'   \item{취사부수}{해당 산후조리업 취사부수}
#'   \item{미화원수}{해당 산후조리업 미화원수}
#'   \item{기타인원수}{해당 산후조리업 기타인원수}
#'   \item{건물층수}{해당 산후조리업 건물층수}
#'   \item{지상층수}{해당 산후조리업 지상층수}
#'   \item{지하층수}{해당 산후조리업 지하층수}
#'}
#' @source \url{https://www.localdata.go.kr/devcenter/dataDown.do?menuNo=20001}
#' @examples
#' library(leaflet)
#' leaflet(postnatal) %>% 
#'   addTiles() %>% 
#'   setView(lng=127.9784, lat=36.866, zoom=7) %>%  
#'   addProviderTiles('CartoDB.Positron') %>% 
#'   addCircles(lng=~`경도`, lat=  ~`위도`,
#'              label =~`사업장명`,
#'              popup =~paste(`사업장명`,"<BR>", "주소 : ",`도로명전체주소`, sep="","<BR>","전화번호 : ",`전화번호`))
"postnatal"

#' 행정안전부 목욕장업 정보
#'
#'  대중목욕탕, 찜질방, 사우나 등 물로 목욕 할 수 있거나 맥반석ㆍ황토 등에게 발생되는 열기 또는 원적외선 등을 이용하여 땀을 낼 수 있는 시설 및 설비 등의 서비스를 제공하는 업소정보, 주소, 번호, 경도, 위도 등을 제공
#' 
#' @format A data frame with 14 variables:
#' \describe{
#'   \item{사업장명}{해당 목욕장업 사업장명}
#'   \item{전화번호}{해당 목욕장업 전화번호}
#'   \item{소재지면적}{해당 목욕장업 소재지면적}
#'   \item{소재지우편번호}{해당 목욕장업 소재지우편번호}
#'   \item{소재지전체주소}{해당 목욕장업 소재지전체주소}
#'   \item{도로명전체주소}{해당 목욕장업 도로명전체주소}
#'   \item{도로명우편번호}{해당 목욕장업 도로명우편번호}
#'   \item{업태구분명}{해당 목욕장업 업태구분명 : 찜질시설서비스영업, 공동탕업, 공동탕업+찜질시설서비스영, 목욕장업 기타, 한증막업}
#'   \item{경도}{해당 목욕장업 경도}
#'   \item{위도}{해당 목욕장업 위도}
#'   \item{건물지상층수}{해당 목욕장업 건물지상층수}
#'   \item{건물지하층수}{해당 목욕장업 건물지하층수}
#'   \item{욕실수}{해당 목욕장업 욕실수}
#'   \item{발한실여부}{해당 목욕장업 발한실여부 : Y, N}
#'}
#' @source \url{https://www.localdata.go.kr/devcenter/dataDown.do?menuNo=20001}
#' @examples
#' bath_color = colorFactor('Set1', bathHouse$업태구분명)
#' 
#' library(leaflet)
#' leaflet(bathHouse) %>% 
#'   addTiles() %>% 
#'   setView(lng=127.9784, lat=36.866, zoom=6) %>%  
#'   addProviderTiles('CartoDB.Positron') %>% 
#'   addCircles(lng=~`경도`, lat=  ~`위도`,
#'              label =~`사업장명`,
#'              popup =~paste(`사업장명`,"<BR>", "주소 : ",`도로명전체주소`, sep="","<BR>","전화번호 : ",`전화번호`),
#'              color = ~bath_color(업태구분명)) %>% 
#'   addLegend(position = 'bottomright', 
#'             title = '업태구분', 
#'             pal = bath_color, values = ~업태구분명, opacity = 0.5)
"bathHouse"

#' 행정안전부 식용얼음판매업 정보
#'
#'  식용얼음을 전문적으로 판매하는 업소정보	, 주소, 번호, 경도, 위도 등을 제공
#' 
#' @format A data frame with 9 variables:
#' \describe{
#'   \item{사업장명}{해당 식용얼음판매업 사업장명}
#'   \item{전화번호}{해당 식용얼음판매업 전화번호}
#'   \item{소재지면적}{해당 식용얼음판매업 소재지면적}
#'   \item{소재지우편번호}{해당 식용얼음판매업 소재지우편번호}
#'   \item{소재지전체주소}{해당 식용얼음판매업 소재지전체주소}
#'   \item{도로명전체주소}{해당 식용얼음판매업 도로명전체주소}
#'   \item{도로명우편번호}{해당 식용얼음판매업 도로명우편번호}
#'   \item{경도}{해당 식용얼음판매업 경도}
#'   \item{위도}{해당 식용얼음판매업 위도}
#' }
#' @source \url{https://www.localdata.go.kr/devcenter/dataDown.do?menuNo=20001}
#' @examples
#' library(leaflet)
#' leaflet(iceMarket) %>% 
#'   addTiles() %>% 
#'   setView(lng=128.9784, lat=35.266, zoom=9) %>% 
#'   addProviderTiles('CartoDB.Positron') %>% 
#'   addCircles(lng=~`경도`, lat=  ~`위도`,
#'              label =~`사업장명`,
#'              popup =~paste(`사업장명`,"<BR>", "주소 : ",`도로명전체주소`, sep="","<BR>","전화번호 : ",`전화번호`))
"iceMarket"

#' 행정안전부 노래연습장업 정보
#'
#'  반주에 맞추어 노래를 부를 수 있는 반주장치 등의 시설을 갖추어 제공하는 업소정보, 주소, 번호, 경도, 위도 등을 제공
#' 
#' @format A data frame with 9 variables:
#' \describe{
#'   \item{사업장명}{해당 노래연습장 사업장명}
#'   \item{전화번호}{해당 노래연습장 전화번호}
#'   \item{소재지전체주소}{해당 노래연습장 소재지전체주소}
#'   \item{도로명전체주소}{해당 노래연습장 도로명전체주소}
#'   \item{도로명우편번호}{해당 노래연습장 도로명우편번호}
#'   \item{경도}{해당 노래연습장 경도}
#'   \item{위도}{해당 노래연습장 위도}
#'   \item{총층수}{해당 노래연습장 총층수}
#'   \item{노래방실수}{해당 노래연습장 노래방실수}
#' }
#' @source \url{https://www.localdata.go.kr/devcenter/dataDown.do?menuNo=20001}
#' @examples
#' library(leaflet)
#' leaflet(singingRoom) %>% 
#'   addTiles() %>% 
#'   setView(lng=126.9784, lat=37.566, zoom=8) %>% 
#'   addProviderTiles('CartoDB.Positron') %>% 
#'   addCircles(lng=~`경도`, lat=  ~`위도`,
#'              label =~`사업장명`,
#'              popup =~paste(`사업장명`,"<BR>", "주소 : ",`도로명전체주소`, sep="","<BR>","전화번호 : ",`전화번호`, "<BR>","노래방실수 : ", 노래방실수))
"singingRoom"

#' 행정안전부 안경업 정보
#'
#'  눈을 보호하거나 시력의 교정을 요하는 대상에게 시력의 교정 및 안경을 판매 또는 수리하는 업소정보, 주소, 번호, 경도, 위도 등을 제공
#' 
#' @format A data frame with 10 variables:
#' \describe{
#'   \item{사업장명}{해당 안경업 사업장명}
#'   \item{영업상태명}{해당 안경업 영업상태명 : 취소/말소/만료/정지/중지, 영업/정상,폐업,휴업}
#'   \item{폐업일자}{해당 안경업 폐업일자}
#'   \item{전화번호}{해당 안경업 전화번호}
#'   \item{소재지우편번호}{해당 안경업 소재지우편번호}
#'   \item{소재지전체주소}{해당 안경업 소재지전체주소}
#'   \item{도로명전체주소}{해당 안경업 도로명전체주소}
#'   \item{도로명우편번호}{해당 안경업 도로명우편번호}
#'   \item{경도}{해당 안경업 경도}
#'   \item{위도}{해당 안경업 위도}
#' }
#' @source \url{https://www.localdata.go.kr/devcenter/dataDown.do?menuNo=20001}
#' @examples
#' library(leaflet)
#' leaflet(optician) %>% 
#'   addTiles() %>% 
#'   setView(lng=126.9784, lat=37.566, zoom=8) %>% 
#'   addProviderTiles('CartoDB.Positron') %>% 
#'   addCircles(lng=~`경도`, lat=~`위도`,
#'              label =~`사업장명`,
#'              popup =~paste(`사업장명`,"<BR>", "주소 : ",`도로명전체주소`, sep="","<BR>","전화번호 : ",`전화번호`))
"optician"


#' 행정안전부 관광숙박업 정보
#'
#'  관광호텔과 같은 숙박시설 및 음식, 운동, 오락 등 적합한 시설 등을 함께 갖추어 제공하는 업소정보, 주소, 번호, 경도, 위도, 객실수 등을 제공
#' 
#' @format A data frame with 16 variables:
#' \describe{
#'   \item{사업장명}{해당 관광숙박업 사업장명}
#'   \item{영업상태명}{해당 관광숙박업 영업상태명 : 취소/말소/만료/정지/중지, 영업/정상,폐업,휴업}
#'   \item{폐업일자}{해당 관광숙박업 폐업일자}
#'   \item{전화번호}{해당 관광숙박업 전화번호}
#'   \item{소재지면적}{해당 관광숙박업 소재지면적}
#'   \item{소재지우편번호}{해당 관광숙박업 소재지우편번호}
#'   \item{소재지전체주소}{해당 관광숙박업 소재지전체주소}
#'   \item{도로명전체주소}{해당 관광숙박업 도로명전체주소}
#'   \item{도로명우편번호}{해당 관광숙박업 도로명우편번호}
#'   \item{경도}{해당 관광숙박업 경도}
#'   \item{위도}{해당 관광숙박업 위도}
#'   \item{총층수}{해당 관광숙박업 총층수}
#'   \item{지상층수}{해당 관광숙박업 지상층수}
#'   \item{지하층수}{해당 관광숙박업 지하층수}
#'   \item{객실수}{해당 관광숙박업 객실수}
#'   \item{영문상호명}{해당 관광숙박업 영문상호명}
#' }
#' @source \url{https://www.localdata.go.kr/devcenter/dataDown.do?menuNo=20001}
#' @examples
#' library(leaflet)
#' leaflet(accom) %>% 
#'   addTiles() %>% 
#'   setView(lng=126.9784, lat=37.566, zoom=8) %>% 
#'   addProviderTiles('CartoDB.Positron') %>% 
#'   addCircles(lng=~`경도`, lat=~`위도`,
#'              label =~`사업장명`,
#'              popup =~paste(`사업장명`,"<BR>", "주소 : ",`도로명전체주소`, sep="","<BR>","전화번호 : ",`전화번호`))
"accom"

#' 행정안전부 동물병원 정보
#'
#'  동물을 진료하거나 동물의 질병을 예방하는 기관정보을 제공, 주소, 경도, 위도, 직원수, 등을 제공
#' 
#' @format A data frame with 11 variables:
#' \describe{
#'   \item{영업상태명}{해당 동물병원의 영업상태명 : 폐업,휴업, 영업/정상, 취소/말소/만료/정지/중지}
#'   \item{폐업일자}{해당 동물병원이 폐업한 동물병원의 경우, 폐업일자}
#'   \item{전화번호}{해당 동물병원의 전화번호}
#'   \item{소재지면적}{해당 동물병원의 소재지면적}
#'   \item{소재지전체주소}{해당 동물병원 소재지 주소}
#'   \item{도로명전체주소}{해당 동물병원 도로명 주소}
#'   \item{도로명우편번호}{해당 동물병원 도로명 우편번호}
#'   \item{사업장명}{해당 동물병원 사업장 명}
#'   \item{경도}{해당 동물병원의 경도 (wgs84)}
#'   \item{위도}{해당 동물병원의 위도 (wgs84)}
#'   \item{총직원수}{해당 동물병원의 총직원수}
#' }
#' @source \url{https://www.localdata.go.kr/devcenter/dataDown.do?menuNo=20001}
#' @examples
#' library(leaflet)
#' leaflet(animalHospital) %>% 
#'   addTiles() %>% 
#'   setView(lng=126.9784, lat=37.566, zoom=8) %>% 
#'   addProviderTiles('CartoDB.Positron') %>% 
#'   addCircles(lng=~`경도`, lat=~`위도`,
#'              label =~`사업장명`)
"animalHospital"



#' 통계청 장애인현황
#'
#'  보건복지부  장애인정책국 장애인정책과에서 제공하는 등록장애인 현황파악을 통한 효율적 정책수립 및 지원, pwd는 pwrson with difficulty 또는 person with disability의 약자이다. 
#' 
#' @format A data frame with 4 variables:
#' \describe{
#'   \item{성별}{해당 시점, 장애분류의 성별}
#'   \item{시점}{해당 장애인현황 조사 시점}
#'   \item{장애분류}{장애분류 : 합계,시각,청각,언어,지적,뇌병변,자폐성,정신,신장,심장,호흡기,간,안면,장루ㆍ요루,뇌전증,}
#'   \item{인구수}{해당 시점, 성별, 장애분류의 인구수:장애인등록인구를 기준으로 하고 등록 외국인을 포함}
#' }
#' @source \url{https://kosis.kr/statHtml/statHtml.do?orgId=117&tblId=DT_11761_N001&vw_cd=MT_ZTITLE&list_id=G_22&seqNo=&lang_mode=ko&language=kor&obj_var_id=&itm_id=&conn_path=MT_ZTITLE}
#' @examples
#' male_2022 <- pwd %>% 
#'   filter(시점 == 2022 & 성별 == "남자" & 장애분류 != "합계")
#' female_2022 <- pwd %>% 
#'   filter(시점 == 2022 & 성별 == "여자" & 장애분류 != "합계")
#' 
#' pwd_2022 <- rbind(male_2022,female_2022) %>% 
#'   arrange(인구수)
#' 
#' pwd_2022$장애분류<- factor(pwd_2022$장애분류, levels = unique(pwd_2022$장애분류))
#' 
#' pp <- ggplot(data=pwd_2022, mapping = aes(x=`장애분류`, fill = `성별`, y = ifelse(test= `성별` == "여자", yes = (-1) *`인구수`, no = `인구수`))) +
#'   geom_bar(stat="identity") +
#'   theme_minimal(base_family = "AppleSDGothicNeo-SemiBold") +
#'   labs(y="")+
#'   scale_y_continuous(labels = function(x) format(abs(x), big.mark = ",", scientific = FALSE), limits = max(pwd_2022$인구수) *c(-1,1)) +
#'   coord_flip() +
#'   scale_fill_manual(values = c("여자" = "lightcoral", "남자" = "cornflowerblue"), labels = c("남자", "여자"))
#' 
#' pp
"pwd"



#' 통계청 경제활동인구조사
#'
#' 국민의 경제활동(취업, 실업, 노동력 등) 특성을 조사함으로써 거시경제 분석과 인력자원의 개발정책 수립에 필요한 기초 자료를 제공
#' 
#' @format A data frame with 7 variables:
#' \describe{
#'   \item{연령계층별}{해당 시점의 경제활동인구 조사 연령계층 : 15-19세, 20-29세, 30-39세, 40-49세, 50-59세, 60세 이상}
#'   \item{시점}{경제활동인구를 실시한 시점}
#'   \item{인구 (천명)}{해당 연령계층의 총 인구}
#'   \item{경제활동인구 (천명)}{만 15세 이상 인구 중 취업자와 실업자를 말한다}
#'   \item{취업자 (천명)}{① 조사대상 주간 중 수입을 목적으로 1시간 이상 일한 자, ② 자기에게 직접적으로는 이득이나 수입이 오지 않더라도 자기가구에서 경영하는 농장이나 사업체의 수입을 높이는 데 도운 가족종사자로서 주당 18시간이상 일한 자(무급가족종사자), ③ 직장 또는 사업체를 가지고 있으나 조사대상 주간 중 일시적인 병, 일기불순, 휴가 또는 연가, 노동쟁의 등의 이유로 일하지 못한 일시휴직자}
#'   \item{실업자 (천명)}{조사대상주간에 수입 있는 일을 하지 않았고, 지난 4주간 일자리를 찾아 적극적으로 구직활동을 하였던 사람으로서 일자리가 주어지면 즉시 취업이 가능한 사람}
#'   \item{비경제활동인구 (천명)}{조사대상 주간 중 취업자도 실업자도 아닌 만 15세 이상인 자, 즉 집안에서 가사와 육아를 전담하는 가정주부, 학교에 다니는 학생, 일을 할 수 없는 연로자와 심신장애자, 자발적으로 자선사업이나 종교단체에 관여하는 자 등을 말한다}
#' }
#' @source \url{https://kosis.kr/statHtml/statHtml.do?orgId=101&tblId=DT_1DA7002S&vw_cd=MT_ZTITLE&list_id=B11&seqNo=&lang_mode=ko&language=kor&obj_var_id=&itm_id=&conn_path=MT_ZTITLE}
#' @examples
#' library(dplyr)
#' library(ggplot2)
#' library(gganimate)
#' 
#' ani_economyPeople <- economyPeople %>% 
#'   mutate(
#'     `경제활동인구비율` = `경제활동인구 (천명)` / `인구 (천명)` * 100
#'   ) %>% 
#'   ungroup() %>% 
#'   arrange(시점, 연령계층별) %>% 
#'   ungroup()
#' 
#' plot_ecoPeople <- ggplot(
#'   ani_economyPeople,
#'   aes(x = `연령계층별`, y = `경제활동인구비율`, fill = `연령계층별`)) +
#'   theme_minimal(base_family = "AppleSDGothicNeo-SemiBold") +
#'   geom_bar(stat='identity') + 
#'   theme(
#'     axis.text.x = element_text(size = 15, color = "grey3", face = "bold"),
#'     axis.title = element_text(size = 17, color = "grey21", face = "bold"),
#'     legend.position = "none",
#'     plot.title = element_text(hjust = 0.5, size = 22, color = "royalblue4", face = "bold"),
#'     axis.line = element_blank(),
#'     panel.grid.major = element_blank(),
#'     panel.grid.minor = element_blank(),
#'     panel.grid.major.x = element_line(size = 0.1, color = "grey"),
#'     plot.background = element_blank()
#'   ) + 
#'   labs(
#'     title = "{closest_state} 연령별 경제활동인구비율",
#'     subtitle = "1999-2023년",
#'     caption = "KOSTAT; 경제활동인구조사(통계청)",
#'     x = "",
#'     y = "경제활동인구비율"
#'   ) +
#'   transition_states(
#'     시점
#'   ) 
#' 
#' ani <- animate(plot_ecoPeople, duration = 30)
#' ani
"economyPeople"


#' 서울특별시 문화행사 정보
#'
#' 서울문화포털에서 제공하는 문화행사 정보입니다. 공연, 행사에 대한 장소, 날짜, 기관명, 이용대상, 이용요금, 출연자, 프로그램 등의 정보를 제공합니다.
#' 
#' @format A data frame with 15 variables:
#' \describe{
#'   \item{자치구}{해당 문화행사 주관 자치구}
#'   \item{공연(행사)명}{해당 문화행사 이름}
#'   \item{일시}{해당 문화행사 날짜 및 시간}
#'   \item{장소}{해당 문화행사 장소}
#'   \item{기관명}{해당 문화행사 주관 기관}
#'   \item{이용대상}{해당 문화행사 이용대상 : 8세 이상 등}
#'   \item{이용요금}{해당 문화행사 이용요금}
#'   \item{출연자정보}{해당 문화행사 출연자 정보}
#'   \item{프로그램소개}{해당 문화행사 프로그램 소개}
#'   \item{홈페이지주소}{해당 문화행사 홈페이지 주소}
#'   \item{대표이미지}{해당 문화행사 대표이미지}
#'   \item{신청일}{해당 문화행사 신청일}
#'   \item{위도}{해당 문화행사 장소 위도}
#'   \item{경도}{해당 문화행사 장소 경도}
#'   \item{유무료}{해당 문화행사 유무료 구분 : 무료 / 유료}
#' }
#' @source \url{https://data.seoul.go.kr/dataList/OA-15486/S/1/datasetView.do}
#' @examples
#' library(leaflet)
#' leaflet(seoulFestival) %>% 
#' addTiles() %>% 
#' setView(lng=126.9784, lat=37.566, zoom=11) %>% 
#' addProviderTiles('CartoDB.Positron') %>% 
#' addCircles(lng=~경도, lat=~위도,
#'            label =~`공연(행사)명`,
#'            popup=~paste(`공연(행사)명`,"<BR>", "기간 : ",일시,sep="","<BR>","장소 : ",장소))
"seoulFestival"

#' 서울특별시 영화관상영관인허가정보
#'
#' 영리를 목적으로 영화를 상영하는 장소 또는 시설 정보 현황입니다. 관리번호, 전화번호, 주소, 층수 등의 정보를 제공합니다.
#' 
#' @format A data frame with 13 variables:
#' \describe{
#'   \item{상영관명}{해당 상영관 명}
#'   \item{관리번호}{해당 상영관 관리번호}
#'   \item{영업상태명}{해당 상영관 영업상태 : 영업/정상 , 폐업, 취소/말소/만료/정지/중지}
#'   \item{폐업일자}{폐업된 상영관 폐업일자}
#'   \item{전화번호}{해당 상영관 전화번호}
#'   \item{지번주소}{해당 상영관 지번주소}
#'   \item{도로명주소}{해당 상영관 도로명주소}
#'   \item{도로명우편번호}{해당 상영관 도로명우편번호}
#'   \item{상영관 X좌표}{해당 상영관 상영관 X좌표 : EPSG:5174 사용}
#'   \item{상영관 Y좌표}{해당 상영관 상영관 Y좌표 : EPSG:5174 사용}
#'   \item{총 층수}{해당 상영관 상영관 총 층수}
#'   \item{지상 층수}{해당 상영관 상영관 지상 층수}
#'   \item{지하 층수}{해당 상영관 상영관 지하 층수}
#' }
#' @source \url{https://data.seoul.go.kr/dataList/OA-16053/S/1/datasetView.do}
#' @examples
#' DT::datatable(head(cinema, 50))
"cinema"


#' 서울특별시 자전거편의시설
#'
#' 서울시 자전거 편의시설현황입니다. 편의시설분류, 위도, 경도, 주소, 우편번호의 정보를 제공합니다.
#' 
#' @format A data frame with 6 variables:
#' \describe{
#'   \item{편의시설명}{자전거 편의 시설 명(ID)}
#'   \item{편의시설분류}{자전거 편의시설 분류(또는 위치)}
#'   \item{경도}{해당 자전거 편의시설 경도}
#'   \item{위도}{해당 자전거 편의시설 위도}
#'   \item{주소}{해당 자전거 편의시설 주소}
#'   \item{우편번호}{해당 자전거 편의시설 우편번호}
#' }
#' @source \url{https://data.seoul.go.kr/dataList/OA-21291/S/1/datasetView.do}
#' @examples
#' library(leaflet)
#' leaflet(bike) %>% 
#'   addTiles() %>% 
#'   setView(lng=126.9784, lat=37.566, zoom=11) %>% 
#'   addProviderTiles('CartoDB.Positron') %>% 
#'   addCircles(lng=~경도, lat=~위도,
#'              label=~편의시설명,
#'              popup=~paste(편의시설명, "<BR>", "주소 : ",주소))
"bike"

#' 서울특별시 사회복지시설 정보
#'
#' 서울시 사회복지시설 정보 (시설명, 시설유형, 시설종류, 시설장명)
#' 
#' @format A data frame with 11 variables:
#' \describe{
#'   \item{시설명}{해당 사회복지시설명}
#'   \item{시설유형}{해당 사회복지시설 유형}
#'   \item{시설종류}{해당 사회복지시설 종류}
#'   \item{시설장명}{해당 사회복지시설의 책임자}
#'   \item{시군구명}{해당 사회복지시설이 위치한 시군구}
#'   \item{시설주소}{해당 사회복지시설의 시설주소}
#'   \item{수용가능인원}{해당 사회복지시설 수용가능인원, 해당 시설에서 한번에 수용가능한 대상자의 수}
#'   \item{이용인원}{해당 사회복지시설 이용인원, 실인원}
#'   \item{전화번호}{해당 사회복지시설 전화번호}
#'   \item{우편번호}{해당 사회복지시설 우편번호}
#'   \item{분류}{해당 사회복지시설 분류 : 노인, 아동, 장애인 등}
#' }
#' @source \url{https://data.seoul.go.kr/dataList/OA-20376/S/1/datasetView.do}
#' @examples
#' library(stringr)
#' library(extrafont)
#' 
#' count <- socialCenter %>% 
#'  group_by(`분류`) %>% 
#'  summarise(`시설수` = n())
#' font_import()
#' y
#' theme_set(theme_light(base_family = "NanumGothic"))
#' p <- ggplot(count) +
#'  geom_col(aes(x=`분류`, y=`시설수`))
"socialCenter"


#' 서울특별시 한파쉼터현황
#'
#' 서울시 한파쉼터 현황입니다. 쉼터별 주소, 면적, 좌표, 인원, 보유품목, 운영시간 등의 정보를 제공합니다.
#' 
#' @format A data frame with 15 variables:
#' \describe{
#'   \item{쉼터명칭}{해당 한파쉼터 명칭}
#'   \item{상세주소}{해당 한파쉼터 상세주소}
#'   \item{면적}{해당 한파쉼터 면적}
#'   \item{이용가능인원}{해당 한파쉼터 이용가능인원}
#'   \item{난방기보유대수(열풍기)}{해당 한파쉼터 난방기보유대수(열풍기)}
#'   \item{난방기보유대수(히터)}{해당 한파쉼터 난방기보유대수(히터)}
#'   \item{난방기보유대수(난로)}{해당 한파쉼터 난방기보유대수(난로)}
#'   \item{난방기보유대수(라디에이터)}{해당 한파쉼터 난방기보유대수(라디에이터)}
#'   \item{사용여부}{해당 한파쉼터 사용여부 : Y , N}
#'   \item{한파쉼터운영시작일}{해당 한파쉼터 운영시작일}
#'   \item{한파쉼터운영종료일}{해당 한파쉼터 운영종료일}
#'   \item{한파쉼터평일시작시간}{해당 한파쉼터 평일시작시간}
#'   \item{한파쉼터평일종료시간}{해당 한파쉼터 평일종료시간}
#'   \item{한파쉼터주말시작시간}{해당 한파쉼터 주말시작시간}
#'   \item{한파쉼터주말종료시간}{해당 한파쉼터 주말종료시간}
#' }
#' @source \url{https://data.seoul.go.kr/dataList/OA-21066/S/1/datasetView.do}
#' @examples
#' DT::datatable(head(warmingCenter, 50))
"warmingCenter"


#' 서울특별시 무더위쉼터 현황
#'
#' 서울시 무더위쉼터 현황입니다. 쉼터별 주소, 면적, 좌표, 인원, 보유품목, 운영시간 등의 정보를 제공합니다.
#' 
#' @format A data frame with 18 variables:
#' \describe{
#'   \item{쉼터명칭}{해당 무더위 쉼터 명칭}
#'   \item{도로명주소}{해당 무더위 쉼터 도로명주소}
#'   \item{지번상세주소}{해당 무더위 쉼터 지번상세주소}
#'   \item{면적}{해당 무더위 쉼터 면적}
#'   \item{이용가능인원}{해당 무더위 쉼터 이용가능인원}
#'   \item{선풍기보유대수}{해당 무더위 쉼터 선풍기보유대수}
#'   \item{에어컨보유대수}{해당 무더위 쉼터 에어컨보유대수}
#'   \item{야간개방}{해당 무더위 쉼터 야간개방 : Y, N}
#'   \item{휴일개방}{해당 무더위 쉼터 휴일개방 : Y, N}
#'   \item{숙박가능여부}{해당 무더위 쉼터 숙박가능여부 : Y, N}
#'   \item{사용여부}{해당 무더위 쉼터 사용여부 : Y , N}
#'   \item{비고}{비고}
#'   \item{운영시작일}{해당 무더위 쉼터 운영시작일}
#'   \item{운영종료일}{해당 무더위 쉼터 운영종료일}
#'   \item{경도}{해당 무더위 쉼터 경도}
#'   \item{위도}{해당 무더위 쉼터 위도}
#'   \item{X좌표}{해당 무더위 쉼터 X좌표(GRS80-중부원점)}
#'   \item{Y좌표}{해당 무더위 쉼터 Y좌표(GRS80-중부원점)}
#' }
#' @source \url{https://data.seoul.go.kr/dataList/OA-21065/S/1/datasetView.do}
#' @examples
#' library(leaflet)
#' leaflet(coolCenter) %>% 
#'  addTiles() %>% 
#'  setView(lng=126.9784, lat=37.566, zoom=11) %>% 
#'  addProviderTiles('CartoDB.Positron') %>% 
#'  addCircles(lng=~경도, lat=~위도,
#'             label=~쉼터명칭,
#'             popup=~paste(쉼터명칭, "<BR>", "선풍기보유대수 : ",선풍기보유대수,sep="","<BR>","에어컨보유대수 : ",에어컨보유대수))
"coolCenter"


#' 서울특별시 지진실내구호소 현황
#'
#' 서울시 지진실내구호소 현황입니다. 시설별 주소, 면적, 좌표값 등의 정보를 제공합니다.
#' 
#' @format A data frame with 9 variables:
#' \describe{
#'   \item{시,군,구 명}{해당 지진실내구호소가 위치한 시, 군, 구}
#'   \item{수용시설 명}{해당 지진실내구호소의 이름}
#'   \item{도로명주소코드}{해당 지진실내구호소 도로명주소코드}
#'   \item{상세주소}{해당 지진실내구호소 주소}
#'   \item{시설면적}{해당 지진실내구호소의 면적}
#'   \item{경도}{해당 지진실내구호소 경도}
#'   \item{위도}{해당 지진실내구호소 위도}
#'   \item{X좌표}{해당 지진실내구호소 X좌표(GRS80-중부원점)}
#'   \item{Y좌표}{해당 지진실내구호소 Y좌표(GRS80-중부원점)}
#' }
#' @source \url{https://data.seoul.go.kr/dataList/OA-21064/S/1/datasetView.do}
#' @examples
#' library(leaflet)
#' leaflet(earthquakeShelter) %>% 
#'   addTiles() %>% 
#'   setView(lng=126.9784, lat=37.566, zoom=11) %>% 
#'   addProviderTiles('CartoDB.Positron') %>% 
#'   addMarkers(lng=~경도, lat=~위도,
#'              label=~수용시설명,
#'              popup=~paste(수용시설명, "<BR>", "시설면적 : ",시설면적,sep=""))
"earthShelter"


#' 서울특별시 문화공간정보
#'
#' 서울문화포털에서 제공하는 서울특별시 문화공간정보입니다. 문화시설명, 주소, 전화번호, 홈페이지, 관람시간, 관람료, 휴관일, 객석수, 위치 등의 정보를 제공합니다.
#' 
#' @format A data frame with 12 variables:
#' \describe{
#'   \item{분류}{문화시설분류(공연장,미술관,도서관 등등)}
#'   \item{문화시설명}{해당 문화시설 이름}
#'   \item{주소}{해당 문화시설 주소}
#'   \item{위도}{해당 문화시설 위도}
#'   \item{경도}{해당 문화시설 경도}
#'   \item{전화번호}{해당 문화시설 전화번호}
#'   \item{홈페이지}{해당 문화시설 홈페이지}
#'   \item{관람시간}{해당 문화시설 관람시간}
#'   \item{휴관일}{해당 문화시설 휴관일}
#'   \item{개관일자}{해당 문화시설 개관일자}
#'   \item{객석수}{해당 문화시설 객석수}
#'   \item{대표이미지}{해당 문화시설 이미지}
#' }
#' @source \url{https://data.seoul.go.kr/dataList/OA-15487/S/1/datasetView.do}
#' @examples
#' library(leaflet)
#' pal <- colorFactor("viridis", seoulCulture$분류)
#' leaflet(seoulCulture) %>% 
#'   addTiles() %>% 
#'   setView(lng=126.9784, lat=37.566, zoom=11) %>% 
#'   addProviderTiles('CartoDB.Positron') %>% 
#'   addCircles(lng=~경도, lat=~위도, color = ~pal(분류))
"seoulCulture"


#' 서울특별시 공공도서관 현황정보
#'
#' 서울특별시 각 자치구의 공공도서관의 현황정보 입니다. 도서관명, 구명, 주소, 전화번호, 홈페이지주소, 운영시간, 정기휴관일, 위치정보 등을 제공합니다.
#' 
#' @format A data frame with 11 variables:
#' \describe{
#'   \item{도서관명}{해당 도서관 이름}
#'   \item{구(코드)}{해당 도서관이 속한 위치한 구의 코드번호}
#'   \item{구명}{해당 도서관이 위치한 구}
#'   \item{주소}{해당 도서관의 주소}
#'   \item{전화번호}{해당 도서관의 전화번호}
#'   \item{홈페이지(URL)}{해당 도서관의 홈페이지 주소}
#'   \item{운영시간}{해당 도서관의 운영시간}
#'   \item{정기휴관일}{해당 도서관의 정기 휴관일}
#'   \item{도서관구분}{해당 도서관의 구분(공공도서관)}
#'   \item{위도}{해당 도서관의 위도}
#'   \item{경도}{해당 도서관의 경도}
#' }
#' @source \url{https://data.seoul.go.kr/dataList/OA-15480/S/1/datasetView.do}
#' @examples
#' library(leaflet)
#' pal <- colorFactor("viridis", seoulLibrary$`구(코드)`)
#' leaflet(seoulLibrary) %>% 
#'   addTiles() %>% 
#'   setView(lng=126.9784, lat=37.566, zoom=11) %>% 
#'   addProviderTiles('CartoDB.Positron') %>% 
#'   addCircles(lng=~경도, lat=~위도, color = ~pal(`구(코드)`))
"seoulLibrary"


#' 서울특별시 서울시립미술관 소장품 정보
#'
#' 서울시립미술관이 소장하고 있는 작품에 대한 작가명, 작품명, 제작연도, 규격, 재질 및 기법 등의 정보를 소개하는 OpenAPI 서비스입니다.
#' 
#' @format A data frame with 10 variables:
#' \describe{
#'   \item{부문}{작품 부문(회화, 뉴미디어 등)}
#'   \item{수집연도}{서울시립미술관이 수집한 연도}
#'   \item{작품명(국문)}{작품명(국문)}
#'   \item{작품명(영문)}{작품명(영어)}
#'   \item{작품규격}{작품 규격(11 x 11cm 또는 11분 11초 형식)}
#'   \item{제작년도}{작품이 제작된 연도}
#'   \item{재료(기법)}{작품에 사용된 재료 또는 기법}
#'   \item{작품해설}{작품에 대한 해설}
#'   \item{작가명}{작가명}
#'   \item{이미지}{해당 작품을 볼 수 있는 이미지}
#' }
#' @source \url{https://data.seoul.go.kr/dataList/OA-15321/S/1/datasetView.do}
#' @examples
#' DT::datatable(head(artmuseum, 50))
"artmuseum"


#' 통계청 인구총조사
#'
#' 통계청에서 제공하는 인구총조사,  대한민국 영토 내에 상주하는 모든 내국인·외국인
#' 1925년부터 2010년까지 5년단위 / 2015년부터 2021년까지 매년 조사된 통계
#'
#' @format A data frame with 5 variables:
#' \describe{
#'   \item{행정구역별}{해당 연도 대한민국 영토 내에 상주하는 모든 내국인·외국인과 이들이 살고 있는 거처}
#'   \item{연령별}{해당 연도에 조사된 인구를 연령별(5살)로 나눈 연령대, (0-4세, 5-9세 ...)}
#'   \item{연도}{조사기준 연도}
#'   \item{분류}{각 행정구역 연령별 인구수를 성별로 나눈 기준 - 남자, 여자}
#'   \item{인구수}{해당 연도, 각 행정구역 연령별 인구 수}
#' }
#' @source \url{https://kosis.kr/statHtml/statHtml.do?orgId=101&tblId=DT_1IN0001_ENG&conn_path=I2}
#' @examples
#' DT::datatable(head(population, 50))
#' 
#' library(dplyr)
#' library(ggplot2)
#' library(gganimate)
#' 
#' population <- datatoys::population
#' population <- subset(population, 행정구역별 != "황해도" & 행정구역별 != "평안북도" & 행정구역별 != "평안남도" & 행정구역별 != "함경북도" & 행정구역별 != "함경남도" & 행정구역별 != "함경북도")
#' population <- population %>%
#'   mutate(
#'     행정구역별 = recode(행정구역별, "서울특별시" = "서울", "부산광역시" = "부산", "충청북도" = "충북", "충청남도" = "충남", 
#'                    "전라북도" = "전북", "전라남도" = "전남", "경상북도" = "경북", "경상남도" = "경남", "대구광역시" = "대구", 
#'                    "광주광역시" = "광주", "대전광역시" = "대전", "울산광역시" = "울산", "인천광역시" = "인천", "경기도" = "경기", 
#'                    "강원도" = "강원", "제주도" = "제주", "세종특별자치시" = "세종", "제주특별자치도" = "제주")
#'   ) %>%
#'   group_by(행정구역별, 연도) %>%
#'   summarise(
#'     인구수_10000 = round(sum(인구수, na.rm = TRUE) / 10000)
#'   ) %>%
#'   ungroup() %>%
#'   group_by(연도) %>%
#'   arrange(연도, desc(인구수_10000)) %>%
#'   mutate(
#'     rank = row_number(),
#'     인구수_char = paste0(" ", 인구수_10000)
#'   ) %>%
#'   ungroup()
#' 
#' area_palette <- c(
#'   "경남" = "#FF65AE",
#'   "경북" = "#FF65AE",
#'   "대구" = "#F763E0",
#'   "울산" = "maroon",
#'   "부산" = "lightpink1",
#'   "전남" = "wheat",
#'   "전북" = "wheat",
#'   "광주" = "tan",
#'   "경기" = "lightblue2",
#'   "서울" = "steelblue1",
#'   "인천" = "turquoise",
#'   "충남" = "gold",
#'   "충북" = "gold",
#'   "대전" = "yellow2",
#'   "세종" = "goldenrod2",
#'   "강원" = "seagreen3",
#'   "제주" = "darkgrey"
#' )
#' 
#' total_population <- ggplot(population, aes(rank, group = 행정구역별)) +
#'   geom_tile(aes(
#'     y = 인구수_10000 / 2,
#'     height = 인구수_10000,
#'     width = 0.9, fill = 행정구역별), 
#'     alpha = 0.8) +
#'   geom_text(aes(y = 0, label = paste(행정구역별, " ")), vjust = 0.2, hjust = 1, size = 5, family = "AppleSDGothicNeo-SemiBold") +
#'   geom_text(aes(y = 인구수_10000, label = 인구수_char, hjust = 0)) +
#'   theme_minimal(base_family = "AppleSDGothicNeo-SemiBold") +
#'   theme(
#'     axis.text.x = element_text(size = 15, color = "grey3", face = "bold"),
#'     axis.title = element_text(size = 17, color = "grey21", face = "bold"),
#'     legend.position = "none",
#'     plot.title = element_text(hjust = 0.5, size = 22, color = "royalblue4", face = "bold"),
#'     axis.line = element_blank(),
#'     axis.text.y = element_blank(),
#'     panel.grid.major = element_blank(),
#'     panel.grid.minor = element_blank(),
#'     panel.grid.major.x = element_line(size = 0.1, color = "grey"),
#'     panel.grid.minor.x = element_line(size = 0.1, color = "grey"),
#'     plot.background = element_blank()
#'   ) +
#'   transition_states(연도,
#'                     transition_length = 40,
#'                     state_length = 10
#'   ) +
#'   scale_y_continuous(breaks = seq(0, 1500, 250), labels = scales::comma) +
#'   scale_x_reverse() +
#'   scale_fill_manual(values = area_palette) +
#'   labs(
#'     title = "{closest_state}년 대한민국 지역별 인구수",
#'     subtitle = "1925-2021년",
#'     caption = "KOSTAT; 인구총조사(통계청)",
#'     x = "",
#'     y = "지역별 총 인구(만명)"
#'   ) +
#'   coord_flip() +
#'   ease_aes("quartic-in-out") +
#'   enter_fade()
#' 
#' animate(plot = total_population, nframes = 400, end_pause = 20, width = 1080, height = 720)
"population"



#' 한국국제협력단 소득수준별 ODA 실적통계
#'
#' 한국국제협력단에서 제공하는 소득수준별 ODA 실적통계로 1991년부터 2019년까지의 연도별, 사업분류별, 지원액(원화), 지원액(달러)
#'
#' @format A data frame with 4 variables.
#' \describe{
#'   \item{연도}{ODA 지원한 연도 : 1991 ~ 2019}
#'   \item{사업분류}{최빈국(LDCs : Least developed countries) : 최저개발국이라고도 하며, 1인당 GDP와 GDP 중 제조업 비중 및 성인 문자해득률 등을 기준으로 최빈국을 지정함
#'   기타저소득국(LICs : Low-income countries) : 취약국가라고도 하며 부가 가난한 사람들을 포함한 국민들에게 기본적인 서비스를 제공할 의사가 없거나 제공할 수 없는 국가를 말한다.
#'   중저소득국(LMICs : Low and Middle-income countries) : GNP 766불∼3,035불
#'   고중소득국(UMICs : Upper Middle-Income Countries) GNP 3,036불 ∼9,385불
#'   미분류, 수원국리스트외 지역}
#'   \item{지원액_원화}{원화 기준 지원액}
#'   \item{지원액_달러}{달러 기준 지원액}
#'  }
#' @source \url{https://www.data.go.kr/data/15060336/fileData.do}
#' @examples
#' DT::datatable(head(odaKR, 50))
"odaKR"




#' 도로교통공단 사망교통사고 정보
#' 
#' 도로교통공단에서 제공하는 사망 교통사고에 대한 개별정보(발생일시, 사고유형, 위치좌표 등)
#' 부상자수 = 중상자수 + 경상자수 + 부상신고자수
#' @format A data frame with 23 variables.
#' \describe{
#'   \item{발생년}{사망 교통사고가 발생한 연도}
#'   \item{발생년월일시}{사망 교통사고가 발생한 발생년월일시}
#'   \item{주야}{사망 교통사고가 발생이 낮에 발생한 것인지, 밤에 발생한 것인지}
#'   \item{요일}{사망 교통사고가 발생한 요일}
#'   \item{사망자수}{사망 교통사고로 인한 사망자수
#'   사망 : 교통사고 발생시로부터 30일이내에 사망한 경우}
#'   \item{부상자수}{사망 교통사고로 인한 부상자수
#'   부상자수는 중상자수 + 경상자수 + 부상신고자수이다.}
#'   \item{중상자수}{사망 교통사고로 인한 중상자수
#'   중상 : 교통사고로 인하여 3주 이상의 치료를 요하는 부상을 입은 경우)}
#'   \item{경상자수}{사망 교통사고로 인한 경상자수
#'   경상 : 교통사고로 인하여 5일 이상 3주 미만의 치료를 요하는 부상을 입은 경우}
#'   \item{부상신고자수}{사망 교통사고로 인한 부상신고자수
#'   부상신고 : 교통사고로 인하여 5일 미만의 치료를 요하는 부상을 입은 경우}
#'   \item{발생지시도}{사망 교통사고가 발생한 시 또는 도}
#'   \item{발생지시군구}{사망 교통사고로 인한 시 또는 군, 구}
#'   \item{사고유형_대분류}{해당 사망 교통사고의 유형
#'   차대사람 : 보행자가 가해운전자 또는 피해운전자가 된 사고, 차대차 :  당해사고의 가해운전자와 피해운전자 모두 차량인 사고, 차량단독 상대방 없이 가해운전자만 있는 경우(추락, 전도, 도로외 이탈 등)와 피해운전자가 주차차량, 물건 및 기타 도로시설물 등인 경우, 철길건널목}
#'   \item{사고유형_중분류}{해당 사망 교통사고의 유형
#'   차도통행중, 추돌, 횡단중, 공작물충돌, 도로이탈, 기타, 정면충돌, 측면충돌, 길가장자리구역통행중, 전도, 전복, 보도통행중, 주/정차차량 충돌, 후진중충돌, 철길건널목}
#'   \item{사고유형}{해당 사망 교통사고의 유형
#'   차도통행중, 추돌, 횡단중, 공작물충돌, 도로이탈 추락, 도로이탈 기타, 기타, 정면충돌, 측면충돌, 길가장자리구역통행중, 전도, 전복, 보도통행중, 주/정차차량 충돌, 후진중충돌, 철길건널목}
#'   \item{가해자법규위반}{해당 사망 교통사고 가해자가 위반한 법규사항
#'   안전운전 의무 불이행, 과속, 보행자 보호의무 위반, 중앙선 침범, 신호위반, 기타, 안전거리 미확보, 교차로 통행방법 위반}
#'   \item{도로형태_대분류}{해당 사망 교통사고가 일어난 도로의 형태
#'   단일로, 교차로, 기타, 불명, 철길건널목}
#'   \item{도로형태}{해당 사망 교통사고가 일어난 도로의 형태
#'   기타단일로, 지하차도(도로)내, 교차로횡단보도내, 교차로내, 교차로부근, 교량위, 기타, 고가도로위, 터널안, 불명, 철길건널}
#'   \item{가해자_당사자종별}{해당 사망 교통사고 가해자가 타고 있던 분류
#'   승용차, 화물차, 농기계, 승합차, 이륜차, 사륜오토바이(ATV), 특수차, 원동기장치자전거, 건설기계, 자전거, 개인형이동수단(PM), 기타}
#'   \item{피해자_당사자종별}{해당 사망 교통사고 피해자 분류
#'   보행자, 화물차, 없음, 승용차, 농기계, 자전거, 이륜차, 승합차, 건설기계, 원동기장치자전거, 불명, 특수차, 사륜오토바이(ATV), 개인형이동수단(PM), 기타}
#'   \item{발생위치X_UTMK}{해당 사망 교통사고가 발생한 위치(X_UTMK)
#'   UTM 좌표계 : UTM 좌표계란 전 지구상의 점들의 위치를 통일된 체계로 나타내기 위한 격자 좌표체계, UTM-K 좌표계: 한국 지리정보원에 사용하는 좌표로 UTM 좌표계를 한국에 맞게 보정}
#'   \item{발생위치Y_UTMK}{해당 사망 교통사고가 발생한 위치(Y_UTMK)
#'   UTM 좌표계 : UTM 좌표계란 전 지구상의 점들의 위치를 통일된 체계로 나타내기 위한 격자 좌표체계
#'   UTM-K 좌표계: 한국 지리정보원에 사용하는 좌표로 UTM 좌표계를 한국에 맞게 보정}
#'   \item{경도}{해당 사망 교통사고가 발생한 경도
#'   경도 : 지구 위의 위치를 나타내는 좌표축 중에서 세로로 된 것}
#'   \item{위도}{해당 사망 교통사고가 발생한 위도
#'   지구 위의 위치를 나타내는 좌표축 중에서 가로로 된 것}
#'  }
#' @source \url{https://www.data.go.kr/data/15070340/fileData.do}
#' @examples
#'  library(leaflet)
#'  accident |> 
#'    dplyr::filter(발생지시도 == "서울") |> 
#'    dplyr::filter(사망자수 > 0) |> 
#'    dplyr::filter(피해자_당사자종별 == "보행자") |> 
#'    leaflet() |> 
#'    addTiles() |> 
#'    addMarkers(~경도, ~위도, popup = ~as.character(사고유형), label = ~as.character(사고유형))
#' DT::datatable(head(accident, 50))
"accident"


#' 국립환경과학원 축산오염원조사정보
#'
#' 국립환경과학원에서 제공하는 축산계 오염원에 대한 조사정보
#' @format A data frame with 18 variables
#' \describe{
#'   \item{법정동코드}{해당축산계 오염원 법정동코드
#'   법정동 : 법률로 지정한 행정구역 단위
#'   법정동코드 : 10자리로 구성, 광역시(2자리) + 시군구(3자리) + 읍면동(3자리) + 리(2자리)
#'   (예) 서울특별시(11) + 용산구(170) + 한남동(131) + 리(00) = 1117013100}
#'   \item{시도}{해당 축산계 오염원 시 또는 도}
#'   \item{시군구}{해당 축산계 오염원 시 또는 군, 구}
#'   \item{읍면동}{해당 축산계 오염원 읍 또는 면, 동}
#'   \item{리}{해당축산계 오염원 리}
#'   \item{축종}{해당 축산계 오염원의 축종
#'   사슴, 마필(말), 산양(염소포함), 유우(젖소), 개, 한우(소), 돼지, 닭, 가금기타, 오리, 면양(육양포함), 타조}
#'   \item{법적규제}{법적규제
#'   신고, 허가, 신고미만}
#'   \item{사육두수.두.}{해당 축산계 오염원의 사육두수}
#'   \item{농가수.호.}{해당 축산계 오염원의 농가수}
#'   \item{가축분뇨발생량.m3.일.}{해당 축산계 오염원에서 발생하는 가축분뇨발생량(1일 기준)}
#'   \item{자가처리_정화방류.m3.일.}{자가처리 중 정화방류양}
#'   \item{자가처리_퇴비화.m3.일.}{자가처리 중 퇴비화양(1일기준)
#'   퇴비화 : 축산농가에서 가축분뇨를 발효시켜 만든 비료성분이 있는 물질 중 액비를 제외한 물질로서 농림축산식품부령으로 정하는 기준에 적합한 것을 생산하는 경우}
#'   \item{자가처리_액비화.m3.일.}{자가처리 중 액비화양(1일 기준)
#'   축산농가에서 가축분뇨를 액체 상태로 발효시켜 만든 비료성분이 있는 물질로서 농림축산식품부령으로 정하는 기준에 적합한 것을 생산하는 경우}
#'   \item{미처리.m3.일.}{해당 축산계 오염원에서 발생하는 미처리양(1일)
#'   미처리 :  가축 방목·방사로 발생된 분뇨를 상기 처리방법 이외 단순 퇴적, 무단방류 등을 하는 경우}
#'   \item{위탁처리_공공처리시설.m3.일.}{위탁처리 중 공공처리시설양(1일기준)
#'   공공처리시설(지자체 운영) : 가축분뇨법 제2조 9항의 따라 지방자치단체의 장이 설치하는 처리시설과「농업협동조합법」 제2조에 따른 조합 및 중앙회(이하 "농협조합"이라 한다)가 제24조제3항에 따라 특별시장·광역시장·도지사(이하 "시·도지사"라 한다), 특별자치시장 또는 특별자치도지사의 승인을 받아 설치하는 자원화시설로 이송하여 처리하는 경우}
#'   \item{위탁처리_공동처리시설.m3.일.}{위탁처리 중 공동처리시설양(1일기준)
#'   공동처리시설(개인 또는 법인) : 가축분뇨법 제12조에 의해  배출시설이 연접하여 위치한 경우(같은 시군구에 위치하지 않은 경우 포함)로서 공동으로 자원화시설 또는 정화시설을 설치하여 처리하는 경우} 
#'   \item{위탁처리_재활용신고자.m3.일.}{위탁처리 중 재활용신고자양(1일기준)
#'    재활용신고자(개인 또는 법인) : 가축분뇨법 제27조 1항에 따라 환경부령으로 정하는 양 이상의 가축분뇨를 재활용(퇴비 또는 액비로 만드는 것에 한정한다.)하거나 재활용을 목적으로 가축분뇨를 수집·운반하기 위하여 신고 받은 자 또는 제11조1항, 제3항에 따라 설치허가·신고를 받은 자, 제28조 제1항, 제2호의 가축분뇨처리업의 허가를 받은 자가 가축분뇨를 재활용하는 경우에 해당하는 시설로 이송하여 처리하는 경우}
#'   \item{위탁처리_가축분뇨처리업.m3.일.}{위탁처리 중 가축분뇨처리업양(1일기준)
#'   가축분뇨처리업(개인 또는 법인) : 가축분뇨법 제28조에 따른 가축분뇨관련영업 중 자원화시설(퇴비·액비를 만드는 시설은 제외한다.) 또는 정화시설을 갖추어 가축분뇨를 최종적으로 안전하게 처리하는 시설로 이송하여 처리하는 경우}
#'  }
#' @source \url{https://www.data.go.kr/data/3045217/fileData.do}
#' @examples
#' DT::datatable(head(pollution, 50))
#' library(highcharter)
#' library(dplyr)
#' library(datatoys)
#' 
#' pollution |> 
#'   group_by(축종) |> 
#'   summarise(
#'     총분뇨발생량 = sum(가축분뇨발생량.m3.일.)
#'   ) |> 
#'   ungroup() |> 
#'   arrange(desc(총분뇨발생량)) |> 
#'   hchart(type = "column", hcaes(축종, 총분뇨발생량), name = "총발생량") |> 
#'   hc_title(
#'     text = "축종별 가축분뇨 총 발생량",
#'     margin = 20,
#'     align = "left"
#'   ) |> 
#'   hc_add_theme(hc_theme_538())


"pollution"




#' 경찰청 범죄 발생 지역별 통계
#'
#' 전국 경찰관서에 고소, 고발, 인지 등으로 형사입건된 사건의 발생, 검거, 피의자에 대한 지역별 분석 현황
#' 범죄대분류, 범죄중분류, 서울, 부산, 대구, 인천, 광주, 대전 울산, 세종, 경기도 지역으로 구분하여 발생 건수 제공
#' @format A data frame with 90 variables.
#' \describe{
#'   \item{범죄대분류}{강력범죄, 교통범죄, 기타범죄, 노동범죄, 마약범죄, 병역범죄, 보건범죄, 선거범죄, 안보범죄, 절도범죄, 지능범죄, 특별경제범죄, 폭력범죄, 풍속범죄, 환경범죄}
#'   \item{범죄중분류}{살인기수, 살인미수등 ,강도, 강간, 유사강간, 강제추행, 기타강간강제추행등, 방화, 절도, 상해, 폭행, 체포감금, 협박, 약취유인, 폭력행위등, 공갈, 손괴, 직무유기, 직권남용, 증수뢰, 통화, 문서인장, 유가증권인지, 사기, 횡령, 배임, 성풍속범죄, 도박범죄, 특별경제범죄, 마약범죄, 보건범죄, 환경범죄, 교통범죄, 노동범죄, 안보범죄, 선거범죄, 병역범죄, 기타범죄}
#'   \item{서울}{서울에서 발생한 범죄 건수}
#'   \item{부산}{부산에서 발생한 범죄 건수}
#'   \item{대구}{대구에서 발생한 범죄 건수}
#'   \item{인천}{인천에서 발생한 범죄 건수}
#'   \item{광주}{광주에서 발생한 범죄 건수}
#'   \item{대전}{대전에서 발생한 범죄 건수}
#'   \item{울산}{울산에서 발생한 범죄 건수}
#'   \item{세종}{세종에서 발생한 범죄 건수}
#'   \item{경기.고양}{경기 고양에서 발생한 범죄 건수}
#'   \item{경기.과천}{경기 과천에서 발생한 범죄 건수}
#'   \item{경기.광명}{경기 광명에서 발생한 범죄 건수}
#'   \item{경기.광주}{경기 광주에서 발생한 범죄 건수}
#'   \item{경기.구리}{경기 구리에서 발생한 범죄 건수}
#'   \item{경기.군포}{경기 군포에서 발생한 범죄 건수}
#'   \item{경기.김포}{경기 김포에서 발생한 범죄 건수}
#'   \item{경기.남양주}{경기 남양주에서 발생한 범죄 건수}
#'   \item{경기.동두천}{경기 동두천에서 발생한 범죄 건수}
#'   \item{경기.부천}{경기 부천에서 발생한 범죄 건수}
#'   \item{경기.성남}{경기 성남에서 발생한 범죄 건수}
#'   \item{경기.수원}{경기 수원에서 발생한 범죄 건수}
#'   \item{경기.시흥}{경기 시흥에서 발생한 범죄 건수}
#'   \item{경기.안산}{경기 안산에서 발생한 범죄 건수}
#'   \item{경기.안성}{경기 안성에서 발생한 범죄 건수}
#'   \item{경기.안양}{경기 안양에서 발생한 범죄 건수}
#'   \item{경기.양주}{경기 양주에서 발생한 범죄 건수}
#'   \item{경기.여주}{경기 여주에서 발생한 범죄 건수}
#'   \item{경기.오산}{경기 오산에서 발생한 범죄 건수}
#'   \item{경기.용인}{경기 용인에서 발생한 범죄 건수}
#'   \item{경기.의왕}{경기 의왕에서 발생한 범죄 건수}
#'   \item{경기.의정부}{경기 의정부에서 발생한 범죄 건수}
#'   \item{경기.이천}{경기 이천에서 발생한 범죄 건수}
#'   \item{경기.파주}{경기 파주에서 발생한 범죄 건수}
#'   \item{경기.평택}{경기 평택에서 발생한 범죄 건수}
#'   \item{경기.포천}{경기 포천에서 발생한 범죄 건수}
#'   \item{경기.하남}{경기 하남에서 발생한 범죄 건수}
#'   \item{경기.화성}{경기 화성에서 발생한 범죄 건수}
#'   \item{강원.강릉}{강원 강릉에서 발생한 범죄 건수}
#'   \item{강원.동해}{강원 동해에서 발생한 범죄 건수}
#'   \item{강원.삼척}{강원 삼척에서 발생한 범죄 건수}
#'   \item{강원.속초}{강원 속초에서 발생한 범죄 건수}
#'   \item{강원.원주}{강원 원주에서 발생한 범죄 건수}
#'   \item{강원.춘천}{강원 춘천에서 발생한 범죄 건수}
#'   \item{강원.태백}{강원 태백에서 발생한 범죄 건수}
#'   \item{충북.제천}{충북 제천에서 발생한 범죄 건수}
#'   \item{충북.청주}{충북 청주에서 발생한 범죄 건수}
#'   \item{충북.충주}{충북 충주에서 발생한 범죄 건수}
#'   \item{충남.계룡}{충남 계룡에서 발생한 범죄 건수}
#'   \item{충남.공주}{충남 공주에서 발생한 범죄 건수}
#'   \item{충남.논산}{충남 논산에서 발생한 범죄 건수}
#'   \item{충남.당진}{충남 당진에서 발생한 범죄 건수} 
#'   \item{충남.보령}{충남 보령에서 발생한 범죄 건수} 
#'   \item{충남.서산}{충남 서산에서 발생한 범죄 건수}
#'   \item{충남.아산}{충남 아산에서 발생한 범죄 건수}
#'   \item{충남.천안}{충남 천안에서 발생한 범죄 건수}
#'   \item{전북.군산}{전북 군산에서 발생한 범죄 건수}
#'   \item{전북.김제}{전북 김제에서 발생한 범죄 건수}
#'   \item{전북.남원}{전북 남원에서 발생한 범죄 건수}
#'   \item{전북.익산}{전북 익산에서 발생한 범죄 건수}
#'   \item{전북.전주}{전북 전주에서 발생한 범죄 건수}
#'   \item{전북.정읍}{전북 정읍에서 발생한 범죄 건수}
#'   \item{전남.광양}{전남 광양에서 발생한 범죄 건수}
#'   \item{전남.나주}{전남 나주에서 발생한 범죄 건수}
#'   \item{전남.목포}{전남 목포에서 발생한 범죄 건수}
#'   \item{전남.순천}{전남 순천에서 발생한 범죄 건수}
#'   \item{전남.여수}{전남 여수에서 발생한 범죄 건수}
#'   \item{경북.경산}{경북 경산에서 발생한 범죄 건수}
#'   \item{경북.경주}{경북 경주에서 발생한 범죄 건수}
#'   \item{경북.구미}{경북 구미에서 발생한 범죄 건수}
#'   \item{경북.김천}{경북 김천에서 발생한 범죄 건수}
#'   \item{경북.문경}{경북 문경에서 발생한 범죄 건수}
#'   \item{경북.상주}{경북 상주에서 발생한 범죄 건수}
#'   \item{경북.안동}{경북 안동에서 발생한 범죄 건수}
#'   \item{경북.영주}{경북 영주에서 발생한 범죄 건수}
#'   \item{경북.영천}{경북 영천에서 발생한 범죄 건수}
#'   \item{경북.포항}{경북 포항에서 발생한 범죄 건수}
#'   \item{경남.거제}{경남 거제에서 발생한 범죄 건수}
#'   \item{경남.김해}{경남 김해에서 발생한 범죄 건수}
#'   \item{경남.마산}{경남 마산에서 발생한 범죄 건수}
#'   \item{경남.밀양}{경남 밀양에서 발생한 범죄 건수}
#'   \item{경남.사천}{경남 사천에서 발생한 범죄 건수}
#'   \item{경남.양산}{경남 양산에서 발생한 범죄 건수}
#'   \item{경남.진주}{경남 진주에서 발생한 범죄 건수}
#'   \item{경남.창원}{경남 창원에서 발생한 범죄 건수}
#'   \item{경남.통영}{경남 통영에서 발생한 범죄 건수}
#'   \item{제주.서귀포}{제주 서귀포에서 발생한 범죄 건수}
#'   \item{제주.제주}{제주 제주에서 발생한 범죄 건수}
#'   \item{기타도시}{기타도시에서 발생한 범죄 건수}
#'   \item{도시이외}{도시이외에서 발생한 범죄 건수}
#'  }
#' @source \url{https://www.data.go.kr/data/3074462/fileData.do}
#' @examples
#' crime |> 
#'   tidyr::pivot_longer(
#'     cols = 서울:도시이외, 
#'     names_to = "시군", 
#'     values_to = "건"
#'   )  
#' DT::datatable(head(crime, 50))
"crime"




#' 한국장학재단 2020년도 장학금 수혜현황
#'
#' 한국장학재단에서 제공하는 전년도 장학금 수혜현황(대학정보공시 항목) 조사를 통해, 대학별 재원구분에 따른 교외장학금 수혜 금액 및 
#' 성격유형에 따른 교내장학금 수혜금액 제공. 2020 회계연도부터 재난을 사유로 지급한 교내장학금 추가 조사.
#' @format A data frame with 16 variables.
#'\describe{
#'   \item{대학명}{장학금 지급 대학명}
#'   \item{학제별}{장학금 지급 대학의 학제구분
#'   전문대학, 대학}
#'   \item{설립별}{장학금 지급 대학의 설립 구분
#'   사립, 국공립}
#'   \item{지역별}{장학금 지급 대학의 지역 구분}
#'   \item{교외장학금.소계.원.}{교외장학금(국가, 지방자치단체, 사설및기타) 합계}
#'   \item{교외장학금.국가}{국가 재원 교외장학금}
#'   \item{교외장학금.지방자치단체}{지방자치단체 재원 교외장학금}
#'   \item{교외장학금.사설및기타}{사설 및 기타 재원 교외 장학금}
#'   \item{교내장학금.소계.원.}{교내장학금(성적우수, 저소득층, 근로, 재난, 교직원, 기타) 합계}
#'   \item{교내장학금.성적우수장학금}{학업성적이 우수한 자에게 지급한 교내장학금}
#'   \item{교내장학금.저소득층장학금}{경제적 사정이 어려운 자에게 지급한 교내 장학금}
#'   \item{교내장학금.근로장학금}{교내외 특정 장소에서 일정시간 근로한 자에게 지급한 교내장학금}
#'   \item{교내장학금.재난장학금}{재난을 사유로 지급한 교내장학금}
#'   \item{교내장학금.교직원장학금"}{대학에서 교직원 또는 그 가족에게 지급한 교내장학금}
#'   \item{교내장학금.기타}{5개 사유(성적우수, 저소득층, 근로, 재난, 교직원)에 해당하지 않는 교내 장학금}
#'   \item{총계.원.}{교외 장학금 및 교내장학금 합계}
#'   }
#' @source \url{https://www.data.go.kr/data/15038576/fileData.do}
#' @examples
#' DT::datatable(head(scholarship, 50))
"scholarship"




#' 국민건강보험 일반건강검진결과
#'
#' 국민건강보험의 직장가입자와 40세 이상의 피부양자, 세대주인 지역가입자와 40세 이상의 지역가입자의 일반건강검진 결과와 이들 일반건강검진 
#' 대상자 중에 만40세와 만66세에 도달한 이들이 받게 되는 생애전환기건강진단 수검이력이 있는 각 연도별 수진자 100만 명에 대한 
#' 기본정보(성, 연령대, 시도코드 등)와 검진내역(신장, 체중, 총콜레스테롤, 혈색소 등)으로 구성된 개방데이터
#' @format A data frame with 31 variables.
#'\describe{
#'  \item{기준년도}{해당 정보의 기준년도}
#'  \item{가입자.일련번호}{해당가입자에 부여한 일련번호}
#'  \item{시도코드}{해당 수진자(진료를 받은 사람) 거주지의 시, 도 코드
#'  코드 11 : 서울특별시, 코드 26 : 부산광역시, 코드 27 : 대구광역시, 코드 28: 인천광역시, 코드 29 : 광주광역시, 코드 30 : 대전광역시, 코드 31 : 울산광역시, 코드 36 : 세종특별자치시, 코드 41 : 경기도, 코드 42 : 강원도, 코드 43 : 충청북도, 코드 44 : 충청남도, 코드 45: 전라북도, 코드 46: 전라남도, 코드 47 : 경상북도, 코드 48 : 경상남도, 코드 49 : 제주특별자치도}
#'  \item{성별코드}{해당 정보 대상자의 성별, 1 : 남자, 2 : 여자}
#'  \item{연령대.코드.5세단위.}{기준년도에 수진자(진료를 받은 사람)의 나이를 5세 단위로 그룹화(범주화)하여 구분한 코드
#'  그룹 1: 0세~4세, 그룹 2: 5세 ~ 9세, 그룹 3: 10세 ~ 14세, 그룹 4 : 15세 ~ 19세, 그룹 5 : 20세 ~ 24세, 그룹 6 : 25세 ~ 29세, 그룹 7 : 30세 ~ 34세, 그룹 8: 35세 ~ 39세, 그룹 9 : 40세 ~ 44세, 그룹 10 : 45세 ~ 49세, 그룹 11: 50세 ~ 54세, 그룹 12 : 55세 ~ 59세, 그룹 13 : 60세 ~ 64세, 그룹 14 : 65세 ~ 69세, 그룹 15 : 70세 ~ 74세, 그룹 16 : 75세 ~ 79세, 그룹  17 :  80세 ~ 84세, 그룹 18 : 85세 이상}
#'  \item{신장.5Cm단위.}{검진자의 키를 5cm로 맞춘 단위
#'  (예) 100~104cm = 100cm}
#'  \item{체중.5Kg.단위.}{검진자의 몸무게를 5kg로 맞춘 단위
#'  (예) 70~74kg = 70kg}
#'  \item{허리둘레}{검진자의 허리둘레(기준년도 2002년~20007년까지의 데이터는 측정되지않아 결측 처리 돼 제공됨)}
#'  \item{시력.좌.}{수검자(진료를 받은 사람)의 좌측 눈 시력
#'  0.1~2,5의 값으로 표기하며 0.1 이하의 시력은 0.1로 표기하고 실명은 9.9로 표기}
#'  \item{시력.우.}{수검자(진료를 받은 사람)의 우측 눈 시력
#'  0.1~2,5의 값으로 표기하며 0.1 이하의 시력은 0.1로 표기하고 실명은 9.9로 표기}
#'  \item{청력.좌.}{수검자(진료를 받은 사람)의 좌측 귀의 청력
#'   1 : 정상, 2 : 비정상}
#'  \item{청력.우.}{수검자(진료를 받은 사람)의 우측 귀의 청력
#'   1 : 정상, 2 : 비정상}
#'  \item{수축기.혈압}{검진자의 최고 혈압으로 심장이 수축해서 강한 힘으로 혈액을 동맥에 보낼 때의 혈관 내압}
#'  \item{이완기.혈압}{검진자의 최저 혈압으로 심장의 완기시의 혈압}
#'  \item{식전혈당.공복혈당.}{검진자 식전 전 혈당(혈액 100ml당 함유 되어 있는 포도당의 농도) 수치}
#'  \item{총.콜레스테롤}{혈청 중의 에스텔형, 비에스테형(유리)콜레스테롤의 합
#'  정상치는 150~250mg/dL 약 1/3이 비에스텔형(유리)콜레스테롤이며 나머지가 콜레스테롤에스테르}
#'  \item{트리글리세라이드}{단순지질 혹은 중성지질을 뜻함
#'  글리세롤에 3분자 지방산이 에스테르 합한 것으로서 자연계에서 찾아낼 수 있는 지방유도체 가운데 가장 분포가 넓음
#'  정상치는 30~135mg/dL(0.34~1.52-mmol/ℓ)(기준년도 2002년~20007년까지의 데이터는 측정되지않아 결측 처리 돼 제공됨)}
#'  \item{HDL.콜레스테롤}{HDL(고밀도 리포단백질)에 포함되는 콜레스테롤
#'  작은 입자의 콜레스테롤로 세포에 이끌려간 콜레스테롤을 간으로 돌려주고 혈관 벽에 쌓인 나쁜 콜레스테롤을 없애는 역할을 하는 성분
#'  정상치는 30~65mg/dL(기준년도 2002년~20007년까지의 데이터는 측정되지않아 결측 처리 돼 제공됨)}
#'  \item{LDL.콜레스테롤}{LDL(저밀도 리포단백질)에 함유된 콜레스테롤
#'  입자가 매우 큰 콜레스테롤로 양이 과도하게 증가할 경우,혈관벽에 쌓여서 동맥경화나 각종 질병을 야기 하는 성분
#'  170mg/dL 이상일 경우 일반적으로 고LDL혈증으로 봄(기준년도 2002년~20007년까지의 데이터는 측정되지않아 결측 처리 돼 제공됨)}
#'  \item{혈색소}{혈액이나 혈구 속에 존재하는 색소단백으로 글로빈(globin)과 헴(heme)으로 구성되며 혈중의 산소운반체로서의 역할 수행}
#'  \item{요단백}{변에 단백질이 섞여 나오는 것
#'  1(-), 2(±), 3(+1), 4(+2), 5(+3), 6(+4)로 표기됨}
#'  \item{혈청크레아티닌}{크레아티닌은 크레아틴의 탈수물로 내인성 단백대사의 종말산물로서 신장에서 배설되고 그 증감은 음식물에 관계없이 근육의 발육과 운동에 관계함, 혈청크레아티닌 농도는 신기능장애에 의해 증량함
#'  정상치 0.8~1.7mg/dL(기준년도 2002년~20007년까지의 데이터는 측정되지않아 결측 처리 돼 제공됨)}
#'  \item{X.혈청지오티.AST}{간 기능을 나타내는 혈액검사상의 수치
#'  간세포 이외에 심장, 신장, 뇌, 근육 등에도 존재하는 효소로 이러한 세포들이 손상을 받는 경우 농도가 증가함
#'  정상치 0~40IU/L}
#'  \item{X.혈청V지오티.ALT}{간 기능을 나타내는 혈액검사상의 수치
#'  ALT는 주로 간세포 안에 존재하는 효소로, 간세포가 손상을 받는 경우 농도가 증가함
#'  정상치 0~40IU/L}
#'  \item{감마.지티피}{ 기능을 나타내는 혈액검사상의 수치
#'  간 내의 쓸개관(담관)에 존재하는 효소로 글루타민산을 외부에 펩티드나 아미노산 등으로 옮기는 작용을 함
#'  쓸개즙(담즙) 배설 장애, 간세포 장애 발생 시 혈중에 증가하게 됨
#'  정상치 남성 11~63IU/L, 여성 8~35IU/L}
#'  \item{흡연상태}{해당 수검자(진료를 받은 사람)의 흡연 상태 여부
#'  1 : 피우지 않는다, 2 : 이전에 피웠으나 끊었다, 3 : 현재도 피우고 있다}
#'  \item{음주여부}{해당 수검자(진료를 받은 사람)의 음주 상태 여부
#'  0 : 마시지않는다, 1 : 마신다.}
#'  \item{구강검진.수검여부}{해당 검진자가 구강검진을 선택하여 검진하였는지 여부에 대한 항목
#'  0 : 미수검, 1 : 수검}
#'  \item{치아우식증유무}{해당 수검자(진료를 받은 사람)의 치우우식증 유무에 대한 항목
#'  0 : 없음,1 : 있음}
#'  \item{치석}{해당 수검자의 치석 여부
#'  치석 : 치근 부위의 잇몸이 내려가 노출된 치아표면이 마모된 것으로 잇몸이 내려앉아 시멘트질 안의 상아질이 노출된 상태
#'  0(없음), 1(있음)}
#'  \item{데이터.공개일자}{데이터 작성 기준일자}
#'}
#' @source \url{https://www.data.go.kr/data/15007122/fileData.do}
#' @examples
#' DT::datatable(head(medicalCheckup, 50))
"medicalCheckup"




#' 산업통상자원부 전국 주유소 등록현황
#'
#' 산업통상자원부에서 제공하는 전국 주유소 등록현황(전국 주유소 신규 등록 , 휴업, 폐업 현황 정보, 연도, 변동사유발생연월일, 판매업종류 등).
#'
#' @format A data frame with 6 variables.
#' \describe{
#'    \item{연도}{주유소 변동사유(신규 등록, 휴업, 폐업 현황)발생 연도}
#'    \item{변동사유발생연월일}{주유소 변동사유(신규 등록, 휴업, 폐업 현황) 발생 연월일}
#'    \item{판매업종류}{주유소}
#'    \item{구분}{주유소 현황
#'    휴업, 신규등록, 폐업, 등록취소}
#'    \item{업체명}{주유소 업체명}
#'    \item{소재지}{주유소 소재지}
#'  }
#' @source \url{https://www.data.go.kr/data/3076606/fileData.do}
#' @examples
#' DT::datatable(head(gasStation, 50))
"gasStation"




#' 국토교통부 2021 공동주택 공시가격 정보
#'
#' 국토교통부에서 제공하는 2021년도 공동주택 공시가격정보입니다. 
#'
#' @format A data frame with 20 variables.
#' \describe{
#'    \item{기준연도}{해당 정보의 기준연도}
#'    \item{기준월}{해당 정보의 기준월}
#'    \item{법정동코드}{해당 공동주택의 법정동코드
#'    법정동 : 법률로 지정한 행정구역 단위
#'   법정동코드 : 10자리로 구성, 광역시(2자리) + 시군구(3자리) + 읍면동(3자리) + 리(2자리)
#'   (예) 서울특별시(11) + 용산구(170) + 한남동(131) + 리(00) = 1117013100}
#'    \item{도로명주소}{해당 정보의 도로명주소
#'    도로명주소 : 도로에 이름을 붙이고 주택, 건물에는 도로를 따라 순차적으로 번호를 붙여 도로명과 건물번호에 의해 표기하는 주소}
#'    \item{시도}{해당 공동주택의 시 또는 도}
#'    \item{시군구}{해당 공동주택의 시 또는 군, 구}
#'    \item{읍면}{해당 공동주택의 읍 또는 면}
#'    \item{동리}{해당 공동주택의 동 또는 리}
#'    \item{특수지코드}{해당 공동주택의 특수지코드
#'    특수지 : 토지용도가 특수하고 거래사례가 희소하여 시장가치 측정이 어려운 토지}
#'    \item{본번}{해당 정보의 도로명주소의 본번
#'    (예) 서울특별시 노원구 덕릉로10길 30-20, 801동 102호 : 본번 30}
#'    \item{부번}{해당 정보의 도로명주소의 부번
#'    (예) 서울특별시 노원구 덕릉로10길 30-20, 801동 102호 : 부번 20}
#'    \item{특수지명}{해당 정보의 도로명주소의 특수지명
#'    특수지 : 토지용도가 특수하고 거래사례가 희소하여 시장가치 측정이 어려운 토지}
#'    \item{단지명}{해당 정보의 도로명주소의 단지명}
#'    \item{동명}{해당 정보의 도로명주소의 동명}
#'    \item{호명}{해당 정보의 도로명주소의 호명}
#'    \item{전용면적}{해당 정보의 도로명주소의 전용면적}
#'    \item{공시가격}{해당 정보의 도로명주소의 공시가격}
#'    \item{단지코드}{해당 정보의 도로명주소의 단지코드}
#'    \item{동코드}{해당 정보의 도로명주소의 동코드}
#'    \item{호코드}{해당 정보의 도로명주소의 호코드}
#'  }
#' @source \url{https://www.data.go.kr/data/3073746/fileData.do}
#' @examples
#' DT::datatable(head(housingPrice, 50))
"housingPrice"




#' 경기도 맛집 정보
#'
#' 경기도 지역 특산물을 활용한 향토 특색음식점으로 경기도를 대표할 수 있는 맛, 위생, 서비스가 우수한 업소를 발굴하여 
#' 경기으뜸맛집으로 육성하고자 선정된 맛집 현황입니다. 음식점명, 맛집전화번호, 대표음식명, 주소, 위경도 등의 정보를 제공합니다.
#'
#' @format A data frame with 9 variables.
#' \describe{
#'    \item{시군명}{해당 음식점의 시 또는 군명}
#'    \item{음식점명}{해당 음식점명}
#'    \item{맛집전화번호 }{해당 음식점 전화번호}
#'    \item{대표음식명 }{해당 음식점의 대표음식명}
#'    \item{소재지우편번호}{해당 음식점 우편번호}
#'    \item{소재지도로명주소}{해당 음식점 도로명주소}
#'    \item{소재지지번주소}{해당 음식점 지번주소}
#'    \item{WGS84위도}{해당 음식점의 WGS84 위도
#'    WGS84: 측지기준계의 종류 중 하나}
#'    \item{WGS84경도}{해당 음식점의 WGS84 경도
#'    WGS84: 측지기준계의 종류 중 하나}
#'  }
#' @source \url{https://www.data.go.kr/data/15057234/openapi.do}
#' @examples
#' DT::datatable(head(restaurant, 50))
"restaurant"




#' 국민연금공단 국민연금사업장 정보
#'
#' 국민연금공단에서 제공하는 법정동단위 지역별, 국민연금 가입 사업장 정보(단, 개인사업장 및 2인 이하 법인 사업장 정보 미제공).
#'
#' @format A data frame with 22 variables.
#' \describe{
#'    \item{자료생성년월}{자료생성년월
#'    월(영어).년(숫자)으로 기입}
#'    \item{사업장명}{국민연금 가입 사업장명}
#'    \item{사업자등록번호}{국민연금 가입 사업장 사업자등록번호}
#'    \item{사업장가입상태코드.1.등록.2.탈퇴}{해당 사업장 국민연금 가입 상태코드
#'    1.등록.2.탈퇴}
#'    \item{우편번호}{해당 사업장 우편번호}
#'    \item{사업장지번상세주소}{해당 사업장 지번 상세주소}
#'    \item{사업장도로명상세주소}{해당 사업장 도로명 상세주소}
#'    \item{고객법정동주소코드}{해당 고객 법정동주소코드
#'    법정동 : 법률로 지정한 행정구역 단위
#'    법정동코드 : 10자리로 구성, 광역시(2자리) + 시군구(3자리) + 읍면동(3자리) + 리(2자리)
#'    (예) 서울특별시(11) + 용산구(170) + 한남동(131) + 리(00) = 1117013100}
#'    \item{고객행정동주소코드}{해당 고객 행정동주소코드
#'    행정동주소 : 행정상 효율을 위해 인구 증감 및 이동 등에 맞춰 나눈 구역}
#'    \item{법정동주소광역시도코드}{해당 법정동주소 광역시도코드
#'    광역시 : 2자리}
#'    \item{법정동주소광역시시군구코드}{해당 법정동주소 광역시시군구코드
#'    시군구 : 3자리}
#'    \item{법정동주소광역시시군구읍면동코드}{법정동주소 광역시 시군구 읍면동 코드
#'    읍면동 :  3자리}
#'    \item{사업장형태구분코드.1.법인.2.개인}{국민연금 가입 사업장 구분 코드
#'    1 : 법인 2:개인}
#'    \item{사업장업종코드}{해당 사업장 업종코드
#'    업종코드 : 국세청이 세원관리 등을 위해 일정한 규칙에 따라 업종마다 부여한 번호}
#'    \item{사업장업종코드명}{해당 사업장 업종코드명}
#'    \item{적용일자}{해당 사업장 적용일자}
#'    \item{재등록일자}{국민연금 재등록한 사업장의 국민연금 재등록일자}
#'    \item{탈퇴일자}{국민연금 탈퇴한 사업장의 국민연금 탈퇴일자}
#'    \item{가입자수}{사업장내 국민연금 가입자수}
#'    \item{당월고지금액}{해당 사업장 국민연금 당월고지금액}
#'    \item{신규취득자수}{해당 사업장 국민연금 신규 취득자수}
#'    \item{상실가입자수}{해당 사업장 국민연금 상실 가입자수}
#'  }
#' @source \url{https://www.data.go.kr/data/15083277/fileData.do}
#' @examples
#' DT::datatable(head(nationalPension, 50))
"nationalPension"




#' 서울특별시 우체국 정보
#'
#' 서울특별시 우체국 정보에 대한 데이터로 전체기관명, 대표 전화번호, 새우편번호, 도로명주소, 행정시, 행정구, 행정동 정보.
#' 
#' @format A data frame with 14 variables.
#' \describe{
#'    \item{키값}{해당 우체국 키값}
#'    \item{기관코드}{해당 우체국 기관코드}
#'    \item{유형1}{우정}
#'    \item{유형2}{우정_우체국}
#'    \item{대표기관명}{미래부}
#'    \item{전체기관명}{우체국 전체이름
#'    (예) 미래창조과학부 우정사업본부 서울지방우정청 서울송파우체국 서울삼전동우체국}
#'    \item{최하위기관명}{최하위기관명
#'    (예) 서울삼전동우체국}
#'    \item{대표전화번호}{해당 우체국 대표전화번호}
#'    \item{새우편번호}{해당 우체국 새우편번호}
#'    \item{주소}{해당 우체국 주소}
#'    \item{도로명주소}{해당 우체국 도로명주소}
#'    \item{행정시}{해당 우체국의 행정시}
#'    \item{행정구}{해당 우체국의 행정구}
#'    \item{행정동}{해당 우체국의 행정동}
#'  }
#' @source \url{https://www.data.go.kr/data/15047367/fileData.do}
#' @examples
#' DT::datatable(head(postOffice,50))
"postOffice"




#' 건강보험심사평가원 의약품 주성분 정보
#'
#' 건강보험심사평가원에서 제공하는 의약품 주성분(일반명) 현황에 대한 데이터셋. 
#' 의약품주성분 코드, 성분명, 제형구분, 투여, 함량, 단위 등 정보를 제공.
#'
#' @format A data frame with 8 variables.
#' \describe{
#'    \item{일반명코드}{주성분에 대한 코드
#'    총 9자리로 구성
#'    1~4자리 : 주성분 일련번호
#'    5~6자리 : 함량 일련번호
#'    7 : 투여경로구분코드
#'    8~9 : 제형구분코드}
#'    \item{제형구분코드}{제형구분코드
#'    일반명코드의 8~9자리 코드}
#'    \item{제형}{해당 의약품의 제형 명칭
#'    과립제,세립, 액제, 산제, 경질캡슐제, 주사제, 정제,저작정, 장용정제 등}
#'    \item{일반명}{해당 의약품의 일반명}
#'    \item{분류번호}{해당 의약품 분류번호}
#'    \item{투여}{해당 의약품 투여방식
#'    내복, 주사, 외용}
#'    \item{함량}{해당 의약품 함량}
#'    \item{단위}{해당 의약품 함량 단위} 
#'  }
#' @source \url{https://www.data.go.kr/data/15067461/fileData.do}
#' @examples
#' DT::datatable(head(medicine,50))
"medicine"




#' 한국소비자원 생필품가격 정보
#'
#' 한국소비자원 참가격정보서비스에 접수된 상품별 생필품 가격 데이터 현황(상품명, 판매업소, 판매가격 등).
#'
#' @format A data frame with 7 variables.
#' \describe{
#'    \item{상품명}{해당 생필품 상품명}
#'    \item{조사일}{해당 생필품 가격 데이터 조사일}
#'    \item{판매가격}{해당 생필품 상품 판매가격}
#'    \item{판매업소}{해당 생필품 상품 판매업소}
#'    \item{제조사}{해당 생필품 상품 제조사}
#'    \item{세일여부}{해당 생필품 상품의 세일 여부
#'    Y : 세일 , N : 세일 안함}
#'    \item{원플러스원}{해당 생필품 상품의 원플러스원 여부}
#'  }
#' @source \url{https://www.data.go.kr/data/15083256/fileData.do}
#' @examples
#' DT::datatable(head(necessariesPrice,50))
"necessariesPrice"




#' 대한무역투자진흥공사 해외진출기업 정보
#'
#' 대한무역투자진흥공사에서 제공하는 전세계 124개국의 해외진출기업의 회사명, 주소, 홈페이지, 진출년도, 진출형태, 투자형태 등의 정보.
#'
#' @format A data frame with 19 variables.
#' \describe{
#'    \item{구분}{해당 해외진출기업의 대륙 : 아시아}
#'    \item{국가명}{해당 기업이 진출한 국가명}
#'    \item{진출지역}{해당 기업이 진출한 지역명}
#'    \item{회사명.국문.}{해당 해외진출기업 국문 회사명}
#'    \item{회사명.영문.}{해당 해외진출기업 영문 회사명}
#'    \item{주소}{해당 해외진출기업 주소}
#'    \item{홈페이지}{해당 해외진출기업 홈페이지}
#'    \item{진출년도}{해당 해외진출기업 진출년도}
#'    \item{진출형태}{해당 해외진출기업 진출형태 : 생산법인, 지점, 판매법인, 서비스법인,연락사무소}
#'    \item{투자형태}{해당 해외진출기업 투자형태 : M&A, 단독, 합작}
#'    \item{외국사.합작지분}{해당 해외진출기업 외국사 합작지분}
#'    \item{업종1}{해당 해외진출기업 업종 : 제조업, 금융·보험업, 도매 및 소매업, 운수업, 농업·임업 및 어업, 건설·공사업, 서비스업, 광업·자원개발, 부동산 및 임대업, 기타, 제조업}
#'    \item{업종2}{해당 해외진출기업 업종 : 목재·가구·펄프·종이, 식료품, 출판·영상·방송통신 및 정보, 사업 시설관리 및 사업지원, 예술·스포츠 및 여가 관련, 기타 서비스업 등}
#'    \item{취급분야}{해당 해외진출기업 취급분야 : 생산법인, 지점, 판매법인, 서비스법인,연락사무소}
#'    \item{본사파견}{해당 해외진출기업 본사파견수}
#'    \item{현지채용}{해당 해외진출기업 현지채용수}
#'    \item{내수.수출}{해당 해외진출기업 내수 및 수출 상태 : 수출 및 내수 병행, 100\% 주재국 내수시장 공급, 100\% 제3국 수출}
#'    \item{모기업명}{해당 해외진출기업 모기업명}
#'    \item{관할무역관}{해당 해외진출기업 관할무역관명 : 오클랜드무역관, 비엔티안무역관, 쿠알라룸푸르무역관, 양곤무역관, 호치민무역관, 하노이무역관}
#'  }
#' @source \url{https://www.data.go.kr/data/15003297/fileData.do}
#' @examples
#' DT::datatable(head(globalBusiness,50))
"globalBusiness"




#' 마포구 반려동물 이름 통계
#'
#' 서울특별시 마포구 지역경제과에서 제공하는 반려동물 이름 현황데이터. 동물이름, 동물 수 데이터를 제공.
#'
#' @format A data frame with 2 variables.
#' \describe{
#'    \item{동물이름}{마포구 반려동물 이름}
#'    \item{건수}{마포구 반려동물 이름 건수}
#'  }
#' @source \url{https://www.data.go.kr/data/15042010/fileData.do}
#' @examples
#' DT::datatable(head(petNames,50))
"petNames"





#' 한국사회복지협의회 2021 전국푸드뱅크 기부자 통계
#' 
#' 한국사회복지협의회에서 제공하는 2021년 전국푸드뱅크 기부자 통계.
#'
#' @format A data frame with 4 variables.
#' \describe{
#'    \item{지역}{지역}
#'    \item{지원센터명}{지원받은 센터명}
#'    \item{기부자명}{푸드뱅크에 기부자명}
#'    \item{합계}{기부 합계}
#' }
#' @source \url{https://www.data.go.kr/data/15060094/fileData.do/}
#' @examples
#' DT::datatable(head(foodBank,50))
"foodBank"




#' 보건복지부 아동학대 신고정보
#' 
#' 보건복지부 아동학대 신고정보에 대한 해당연도 말 시점의 시도별, 의심사례, 일반상담, 동일신고, 
#' 해외발생, 교직원, 의료인 등 신고현황통계.
#'
#' @format A data frame with 4 variables.
#' \describe{
#'    \item{기간}{아동학대 신고 기간
#'    년도별, 2013년~2018년}
#'    \item{구분}{아동학대 신고 지역 구분}
#'    \item{신고자}{아동학대 신고자 구분}
#'    \item{신고건수}{아동학대 신고건수}
#'  }
#' @source \url{https://www.data.go.kr/data/15065291/fileData.do}
#' @examples
#' DT::datatable(head(childAbuse,50))
"childAbuse"




#' 한국교통안전공단 자동차검사소 정보
#' 
#' 한국교통안전공단에서 운영하고 있는 자동차검사소 정보. 해당 지역별 리스트와 위도, 경도 등 각종 정보를 제공.
#'
#' @format A data frame with 22 variables.
#' \describe{
#'    \item{자동차검사소명}{해당 자동차검사소명}
#'    \item{자동차검사소유형}{해당 자동차검사소 유형
#'    공공}
#'    \item{소재지도로명주소}{해당 자동차검사소 도로명주소}
#'    \item{소재지지번주소}{해당 자동차검사소 지번주소}
#'    \item{위도}{해당 자동차검사소 위도}
#'    \item{경도}{해당 자동차검사소 경도}
#'    \item{검사소전화번호}{해당 자동차검사소 전화번호}
#'    \item{운영시간}{해당 자동차검사소 운영시간}
#'    \item{검사진로수}{해당 자동차검사소 검사진로수}
#'    \item{부지면적}{해당 자동차검사소 부지면적}
#'    \item{건물면적}{해당 자동차검사소 건물면적}
#'    \item{검사기술인력수}{해당 자동차검사소 검사기술인력수}
#'    \item{신규검사여부}{해당 자동차검사소 신규검사여부
#'    Y : 예, N: 아니오}
#'    \item{정기검사여부}{해당 자동차검사소 정기검사여부
#'    Y : 예, N: 아니오}
#'    \item{튜닝검사여부}{해당 자동차검사소 튜닝검사여부
#'    Y : 예, N: 아니오}
#'    \item{임시검사여부}{해당 자동차검사소 임시검사여부
#'    Y : 예, N: 아니오}
#'    \item{수리검사여부}{해당 자동차검사소 수리검사여부
#'    Y : 예, N: 아니오}
#'    \item{배출가스정밀검사여부}{해당 자동차검사소 배출가스정밀검사여부
#'    Y : 예, N: 아니오}
#'    \item{택시미터검정여부}{해당 자동차검사소 택시미터검정여부
#'    Y : 예, N: 아니오}
#'    \item{관리기관전화번호}{해당 자동차검사소 관리기관전화번호}
#'    \item{관리기관명}{해당 자동차검사소 관리기관명}
#'    \item{데이터기준일자}{해당 데이터의 기준일자}
#'  }
#' @source \url{https://www.data.go.kr/data/3041572/fileData.do}
#' @examples
#' DT::datatable(head(carInspection,50))
"carInspection"





#' 소방청 전국 소방서 정보
#' 
#' 소방청에서 제공하는 전국 소방서 정보.
#'
#' @format A data frame with 5 variables.
#' \describe{
#'    \item{순번}{순번}
#'    \item{본부명}{해당 소방서 본부명}
#'    \item{소방서}{해당 소방서명}
#'    \item{주소}{해당 소방서 주소}
#'    \item{전화번호}{해당 소방서 전화번호}
#'  }
#' @source \url{https://www.data.go.kr/data/15048242/fileData.do}
#' @examples
#' DT::datatable(head(fireStation,50))

"fireStation"




#' 국민건강보험공단 2014-15 혈액검사 데이터
#' 
#' 국민건강보험공단에서 제공하는 2014~2015년 일반검진 및 생애전환기 건강검진 혈액검사 데이터.
#'
#' @format A data frame with 5 variables.
#' \describe{
#'   \item{SEX}{성별(남성:1, 여성:2)}
#'   \item{AGE_G}{연령(그룹)}
#'   \item{HGB}{혈색소}
#'   \item{TCHOL}{총콜레스테롤}
#'   \item{TG}{중성지방}
#'   \item{HDL}{HDL콜레스테롤}
#'   \item{ANE}{빈혈 진료여부 
#'   1: 있음, 0: 없음}
#'   \item{IHD}{허혈심장질환 진료여부
#'   1: 있음, 0: 없음}
#'   \item{STK}{뇌혈관질환 진료여부
#'   1: 있음, 0: 없음}
#'  }
#' @source \url{https://www.data.go.kr/data/15095107/fileData.do}
#' @examples
#' DT::datatable(head(bloodTest, 50))
"bloodTest"




#' 한국국제협력단 국가별 개발협력동향정보
#' 
#' 한국국제협력단에서 제공하는 국가별 개발 협력 동향정보 데이터. 지역, 국가, 관할사무소, 구분(공여국/수원국/국제기구/KOICA), 
#' KOICA 12대분야 및 기타, 동향기사 제목 및 본문내용, 출처, 링크 정보를 제공. 
#'
#' @format A data frame with 16 variables.
#' \describe{
#'    \item{국가명}{개발 협력 국가명}
#'    \item{지역}{개발 협력 국가 지역
#'    서아프리카, 중남미, 서남아태평양, 동남아시아, 중동북아프리카, 동아프리카, 유라시아}
#'    \item{사무소}{개발 협력 사무소}
#'    \item{구분}{구분
#'    수원국, 공여국, KOICA, 국제기구}
#'    \item{분야}{개발협력 분야
#'    거버넌스평화, 기타, 보건, 교통, 에너지, 교육, 과학기술혁신, 기후행동, 인권, 성평등, 농촌개발, 도시, 물}
#'    \item{제목}{개발 협력 동향기사 제목}
#'    \item{본문1}{개발 협력 동향기사 본문1}
#'    \item{본문2}{개발 협력 동향기사 본문2}
#'    \item{본문3}{개발 협력 동향기사 본문3}
#'    \item{제목_현지공용어}{개발 협력 동향기사 현지공용어 제목}
#'    \item{본문1_현지공용어}{개발 협력 동향기사 현지공용어 본문1}
#'    \item{본문2_현지공용어}{개발 협력 동향기사 현지공용어 본문2}
#'    \item{본문3_현지공용어}{개발 협력 동향기사 현지공용어 본문3}
#'    \item{출처}{개발 협력 동향기사 출처}
#'    \item{링크}{개발 협력 동향기사 링크}
#'    \item{날짜}{개발 협력 동향기사 날짜}
#'  }
#' @source \url{https://www.data.go.kr/data/15052910/fileData.do}
#' @examples
#' DT::datatable(head(odaNews, 50))
"odaNews"



#' 국토교통부 법정동 정보
#' 
#' 국토교통부에서 제공하는 법정동 정보. 우리나라의 법정 구역으로 법률로 지정된 일정한 명칭과 영역을 지닌 구역으로 
#' 토지행정시스템에서 사용하는 법정동 데이터. 현존하는 법정동코드는 삭제일자가 없으며, 과거법정동코드는
#' 행정표준코드관리시스템(https://www.code.go.kr)에서 제공하는 법정동코드 자료를 바탕으로 시스템 사용 용도에 
#' 맞춰 가공한 데이터로 정보가 상이할 수 있음.
#'
#' @format A data frame with 9 variables.
#' \describe{
#'    \item{법정동코드}{해당 지역 법정동코드
#'    법정동 : 법률로 지정한 행정구역 단위
#'    법정동코드 : 10자리로 구성, 광역시(2자리) + 시군구(3자리) + 읍면동(3자리) + 리(2자리)}
#'    \item{시도명}{해당 지역 시 또는 도명}
#'    \item{시군구명}{해당 지역 시 또는 군, 구명}
#'    \item{읍면동명}{해당 지역 읍 또는 면, 동명}
#'    \item{리명}{해당 지역 리명}
#'    \item{순위}{순위}
#'    \item{생성일자}{해당 지역 법정동코드 생성일자}
#'    \item{삭제일자}{해당 지역 법정동코드 삭제일자}
#'    \item{과거법정동코드}{해당 지역 과거법정동코드}
#'  }
#' @source \url{https://www.data.go.kr/data/15063424/fileData.do}
#' @examples
#' DT::datatable(head(legalDong, 50))
"legalDong"




#' 건강보험심사평가원 병의원 기본정보
#' 
#' 건강보험심사평가원에서 제공하는 병의원 기본정보 데이터셋.
#'
#' @format A data frame with 29 variables.
#' \describe{
#'    \item{암호화요양기호}{암호화요양기호}
#'    \item{요양기관명}{해당 병의원 기관명}
#'    \item{종별코드}{해당 병의원 종별코드}
#'    \item{종별코드명}{해당 병의원 종별코드명
#'    상급종합, 종합병원, 병원, 요양병원, 정신병원, 의원}
#'    \item{시도코드}{해당 병의원 시도코드}
#'    \item{시도코드명}{해당 병의원 시도코드명
#'    인천, 강원, 서울, 대구, 경남, 경기, 충남, 부산, 전북, 광주, 대전, 충북, 울산, 전남, 경북, 세종시, 제주}
#'    \item{시군구코드}{해당 병의원 시 또는 군,구 코드}
#'    \item{시군구코드명}{해당 병의원 시 또는 군,구 코드명}
#'    \item{읍면동}{해당 병의원 읍 또는 면, 동}
#'    \item{우편번호}{해당 병의원 우편번호}
#'    \item{주소}{해당 병의원 주소}
#'    \item{전화번호}{해당 병의원 전화번호}
#'    \item{병원URL}{해당 병의원 병원URL}
#'    \item{개설일자}{해당 병의원 개설일자}
#'    \item{총의사수}{해당 병의원 총 의사수}
#'    \item{의과일반의.인원수}{해당 병의원 의과일반의 인원수}
#'    \item{의과인턴.인원수}{해당 병의원 의과인턴 인원수}
#'    \item{의과레지던트.인원수}{해당 병의원 의과레지던트 인원수}
#'    \item{의과전문의.인원수}{해당 병의원 의과전문의 인원수}
#'    \item{치과일반의.인원수}{해당 병의원 치과일반의 인원수}
#'    \item{치과인턴.인원수}{해당 병의원 치과인턴 인원수}
#'    \item{치과레지던트.인원수}{해당 병의원 치과레지던트 인원수}
#'    \item{치과전문의.인원수}{해당 병의원 치과전문의 인원수}
#'    \item{한방일반의.인원수}{해당 병의원 한방일반의 인원수}
#'    \item{한방인턴.인원수}{해당 병의원 한방인턴 인원수}
#'    \item{한방레지던트.인원수}{해당 병의원 한방레지던트 인원수}
#'    \item{한방전문의.인원수}{해당 병의원 한방전문의 인원수}
#'    \item{x좌표}{해당 병의원 x좌표}
#'    \item{y좌표}{해당 병의원 y좌표}
#'  }
#' @source \url{https://www.data.go.kr/data/15051059/fileData.do}
#' @examples
#' DT::datatable(head(hospitalInfo,50))
"hospitalInfo"


#' 건강보험심사평가원 약국 기본정보
#' 
#' 건강보험심사평가원에서 제공하는 약국 기본정보 데이터셋.
#'
#' @format A data frame with 15 variables.
#' \describe{
#'    \item{암호화요양기호}{해당 약국 암호화요양기호}
#'    \item{요양기관명}{해당 약국 명}
#'    \item{종별코드}{해당 약국 종별코드}
#'    \item{종별코드명}{해당 약국 종별코드명
#'    약국}
#'    \item{시도코드}{해당 약국 시도코드}
#'    \item{시도코드명}{해당 약국 시도코드명
#'    부산, 서울, 광주, 충북, 경기, 충남, 울산, 경남, 대전, 세종시, 제주, 전북, 대구, 강원, 경북, 전남, 인천}
#'    \item{시군구코드}{해당 약국 시군구코드}
#'    \item{시군구코드명}{해당 약국 시군구코드명}
#'    \item{읍면동}{해당 약국 읍면동}
#'    \item{우편번호}{해당 약국 우편번호}
#'    \item{주소}{해당 약국 주소}
#'    \item{전화번호}{해당 약국 전화번호}
#'    \item{개설일자}{해당 약국 개설일자}
#'    \item{x좌표}{해당 약국 x좌표}
#'    \item{y좌표}{해당 약국 y좌표}
#'  }
#' @source \url{https://www.data.go.kr/data/15051059/fileData.do}
#' @examples
#' DT::datatable(head(pharmacyInfo,50))
"pharmacyInfo"




#' 한국장학재단 장학금 정보
#' 
#' 한국장학재단에서 제공하는 매년 4월 대학정보공시 기준의 대학별 입학정원, 평균입학금, 평균등록금 정보(분교, 캠퍼스는 본교에 통합 산출).
#'
#' @format A data frame with 7 variables.
#' \describe{
#'    \item{학제별}{해당 대학 학제 구분
#'    대학, 전문대학}
#'    \item{설립별}{해당 대학 설립 구분
#'    국공립, 사립}
#'    \item{대학명}{해당 대학명}
#'    \item{지역별}{해당 대학 지역구분}
#'    \item{입학정원.합.명.}{해당 대학 입학정원 합(명))}
#'    \item{평균입학금.원.}{해당 평균 입학금(원)}
#'    \item{평균등록금.원.}{해당 평균 등록금(원)}
#'  }
#' @source \url{https://www.data.go.kr/data/15060094/fileData.do/}
#' @examples
#' DT::datatable(head(tuition,50))
"tuition"




#' 농림축산식품부 농업 종관기상 데이터
#' 
#' 농림축산식품부에서 제공하는 농업 종관기상 데이터.
#'
#' @format A list with 3 data frame.
#' \describe{
#'    \item{code}{기상청 데이터
#'    기상청관측지점번호, 기상청지점명, 기상청설치위도, 기상청설치경도}
#'    \item{day}{일단위 농업기상
#'    기상청관측지점번호, 관측시각, 지중온도150CM, X9_9강수, 최저해면기압, 평균상대습도, 평균상대습도시각, 최대순간풍속풍향 등}
#'    \item{hour}{시간단위 농업기상
#'    기상청관측지점번호,관측시각,지중온도30CM,지중온도20CM,지중온도10CM,지중온도5CM,지면온도,현상번호,지면상태코드,시정,최저운고,운형코드,중하층운량,전운량}
#'  }
#' @source \url{https://www.data.go.kr/data/15034381/fileData.do}
#' @examples
#' DT::datatable(head(weather2020$code,50))
#' DT::datatable(head(weather2020$day,50))
#' DT::datatable(head(weather2020$hour,50))
"weather2020"




#' 국토교통부 전세계 공항정보
#' 
#' 국토교통부에서 제공하는 전세계 공항의 영문 공항명, 한글 공항명, IATA 코드, ICAO 코드, 국가명, 지역명에 대한 정보.
#'
#' @format A list with 8 data frame.
#' \describe{
#'    \item{영문공항명}{해당 공항 영문공항명}
#'    \item{한글공항명}{해당 공항 한글공항명}
#'    \item{공항코드1.IATA.}{해당 공항 IATA 공항코드
#'    IATA : International Air Transport Association, 국제항공운송협회에서 제정한 국제표준으로 세 문자 코드로 구성되어 있으며, 세계의 모든 공항이 IATA에 의해 중복되지 않게 코드를 부여받는다.}
#'    \item{공항코드2.ICAO.}{해당 공항 ICAO 공항코드
#'     국제 민간 항공 기구(ICAO/OACI)에서 비행정보구역(FIR)과 공항에 부여하는 코드}
#'    \item{지역}{해당 공항 지역
#'    유럽, 중남미, 아프리카, 중동, 북미, 아시아, 대양주, 남미}
#'    \item{영문국가명}{해당 공항 영문국가명}
#'    \item{한글국가명}{해당 공항 한글국가명}
#'    \item{영문도시명}{해당 공항 영문도시명}
#'  }
#' @source \url{https://www.data.go.kr/data/3051587/fileData.do}
#' @examples
#' DT::datatable(head(airport,50))
"airport"




#' 한국국제협력단 협력국 개발지표 및 ODA 지원 실적
#' 
#' 한국국제협력단(KOICA)에서 제공하는 협력국(총 138개국/ 사무소 주재국 44개, 겸임국 94개)의 개발 지표 및 ODA 지원 실적. 
#' *개발지표: 인구, 경제, 인간개발, 빈곤, 교육, 재정, 거버넌스, 비즈니스, 산업인프라, 성평등
#' *출처: World Bank Open data, Human Development Data Center, Fragile States Index, Transparency International, 
#' UN Department of Economic and Social Affairs Public Institutions, OECD Statistics, KOICA ODA 정보센터
#'
#' @format A list with 80 data frame.
#' \describe{
#'    \item{WB_국가명}{WB 국가명
#' WB: World Bank 세계은행}
#'    \item{ISO3_국가코드}{ISO3 국가코드
#'    ISO : International Organization for Standardization}
#'    \item{DAC_국가코드}{DAC 국가코드
#'    DAC : Development Assistance Committee, 개발 원조 위원회}
#'    \item{UNDP_국가명}{UNDP 국가명
#'    UNDP : 개도국에 대한 유엔의 개발 원조계획을 조정하기 위한 기관}
#'    \item{WB_지역}{WB 지역
#'    WB: World Bank 세계은행}
#'    \item{KOICA_국가명_국문}{KOICA 국가명 국문}
#'    \item{KOICA_지역명_국문}{KOICA 지역명 국문}
#'    \item{KOICA_지역명_영문}{KOICA 지역명 영문}
#'    \item{KOICA_지역명_부서}{KOICA 지역명 부서}
#'    \item{국가협력전략.대상국가}{국가협력전략 대상 국가 여부
#'    yes, no}
#'    \item{KOICA.사무소.주재.여부}{KOICA 사무소 주재 여부
#'    yes, no}
#'    \item{겸임국.관할.사무소명}{겸임국 관할 사무소명}
#'    \item{OECD_국가명}{OECD 국가명}
#'    \item{OECD소득.기준}{OECD소득 기준}
#'    \item{인구수_기준연도}{해당 인구수 데이터의 기준연도
#'    2020, 2011}
#'    \item{인구수}{인구수}
#'    \item{GDP_기준연도}{해당 GDP 데이터의 기준연도}
#'    \item{X1인당.국내총생산}{1인당.국내총생산}
#'    \item{국민총생산.기준연도}{해당 국민총생산 데이터의 기준연도}
#'    \item{X1인당.국민총생산}{1인당 국민총생산}
#'    \item{빈곤율.기준연도}{해당 빈곤율 데이터의 기준연도}
#'    \item{빈곤율}{빈곤율}
#'    \item{지니계수.기준연도}{해당 지니계수 데이터의 기준연도}
#'    \item{지니계수}{지니계수
#'    지니계수 : 빈부격차와 계층간 소득의 불균형 정도를 나타내는 수치로, 소득이 어느 정도 균등하게 분배되는지를 알려줌.
#'    지니계수는 0부터 1까지의 수치로 표현되는데, 값이 ‘0’(완전평등)에 가까울수록 평등하고 ‘1’(완전불평등)에 근접할수록 불평등하다는 것을 나타냄}
#'    \item{문해율.기준연도}{해당 문해율 데이터의 기준연도}
#'    \item{문해율}{문해율}
#'    \item{중등학교.등록율.여학생..기준연도}{해당 여학생 중등학교 등록율 데이터의 기준연도}
#'    \item{중등학교.등록율.여학생.}{여학생 중등학교 등록율}
#'    \item{중등학교.등록률.남학생..기준연도}{해당 남학생 중등학교 등록율 데이터의 기준연도}
#'    \item{중등학교.등록율.남학생.}{남학생 중등학교 등록율}
#'    \item{중등학교.등록율.젠더.패리티.인덱스.기준연도}{중등학교 등록율 젠더 패리티 인덱스 데이터의 기준연도}
#'    \item{중등학교.등록율.젠더.패리티.인덱스}{중등학교 등록율 젠더 패리티 인덱스}
#'    \item{세금.기준연도}{세금 데이터의 기준연도}
#'    \item{세금}{세금}
#'    \item{ODA.순.수원액.기준연도}{ODA 순 수원액 데이터의 기준연도}
#'    \item{ODA.순.수원액}{ODA 순 수원액}
#'    \item{기업여건.기준연도}{기업여건 데이터의  기준연도}
#'    \item{기업여건}{기업여건}
#'    \item{해외직접투자.기준연도}{해외직접투자 데이터의 기준연도}
#'    \item{해외직접투자}{해외직접투자}
#'    \item{X100명당.이동통신.사용률.기준연도}{100명당 이동통신 사용률 데이터의 기준연도}
#'    \item{X100명당.이동통신.사용률}{100명당 이동통신 사용률}
#'    \item{X1인당.전기.소비량.기준연도}{1인당 전기 소비량 데이터의 기준연도}
#'    \item{X1인당.전기.소비량}{1인당 전기 소비량}
#'    \item{인터넷.사용률.기준연도}{인터넷 사용률 데이터의 기준연도}
#'    \item{인터넷.사용률}{인터넷 사용률}
#'    \item{취약국가.지수.기준연도}{취약국가 지수 데이터의 기준연도}
#'    \item{취약국가.지수}{취약국가 지수}
#'    \item{취약국가.순위}{취약국가 순위}
#'    \item{부패인식지수.기준연도}{부패인식지수 데이터의 기준연도}
#'    \item{부패인식점수}{부패인식점수}
#'    \item{부패인식순위}{부패인식순위}
#'    \item{전자정부.지수.기준연도}{전자정부 지수 데이터의 기준연도}
#'    \item{전자정부.지수.순위}{전자정부 지수 순위}
#'    \item{전자정부지수}{전자정부지수}
#'    \item{인간개발지수.기준연도}{인간개발지수 데이터의 기준연도}
#'    \item{인간개발지수순위}{인간개발지수순위}
#'    \item{인간개발지수}{인간개발지수}
#'    \item{젠더개발지수.기준연도}{젠더개발지수 데이터의 기준연도}
#'    \item{젠더개발지수}{젠더개발지수}
#'    \item{젠더.불평등.지수.기준연도}{젠더 불평등 지수 데이터의 기준연도}
#'    \item{젠더.불평등.지수}{젠더 불평등 지수}
#'    \item{여성국회의원.비율.기준연도}{여성국회의원비율 데이터의 기준연도}
#'    \item{여성국회의원.비율}{여성국회의원 비율}
#'    \item{여성실업률.기준연도}{여성실업률 데이터의 기준연도}
#'    \item{여성실업률}{여성실업률}
#'    \item{ODA.규모.기준연도}{ODA 규모 데이터의 기준연도}
#'    \item{수원국.ODA.규모}{수원국 ODA 규모}
#'    \item{양자.지원.규모}{양자 지원 규모}
#'    \item{GNI.대비.ODA.비율}{GNI 대비 ODA 비율}
#'    \item{한국.ODA.규모.기준연도}{한국 ODA 규모 데이터의 기준연도}
#'    \item{한국.ODA.규모}{한국 ODA 규모}
#'    \item{KOICA.지원.규모_공공행정}{KOICA 지원 공공행정 분야 규모}
#'    \item{KOICA.지원.규모_교육}{KOICA 지원 교육 분야 규모}
#'    \item{KOICA.지원.규모_기술환경에너지}{KOICA 지원 기술환경에너지 분야 규모}
#'    \item{KOICA.지원.규모_기타}{KOICA 지원 기타 분야 규모}
#'    \item{KOICA.지원.규모_긴급구호}{KOICA 지원 긴급구호 분야 규모}
#'    \item{KOICA.지원.규모_농림수산}{KOICA 지원 농림수산 규모}
#'    \item{KOICA.지원.규모_보건}{KOICA 지원  보건 규모}
#'    \item{KOICA.지원.규모_전체}{KOICA 지원  전체 규모}
#'  }
#' @source \url{https://www.data.go.kr/data/15088160/fileData.do}
#' @examples
#' DT::datatable(head(odaIndex,50))
"odaIndex"





#' 행정안전부 단란주점 영업 정보
#' 
#' 행정안전부에서 제공하는 단란주점 영업 정보. 주로 주류와 함께 음식류를 조리 및 판매하는 곳으로 손님이 노래를 부르는 행위가 허용되는 업소정보 데이터로 인허가일자, 영업상태, 사업장명, 소재지주소 등의 정보등을 제공. * 좌표계 : 중부원점TM(EPSG:2097).
#'
#' @format A list with 48 data frame.
#' \describe{
#'    \item{번호}{해당 단란주점 번호}
#'    \item{개방서비스명}{해당 단란주점 서비스명
#'    단란주점영업}
#'    \item{개방서비스아이디}{해당 단란주점 개방서비스아이디}
#'    \item{개방자치단체코드}{해당 단란주점 개방자치단체코드}
#'    \item{관리번호}{해당 단란주점 관리번호}
#'    \item{인허가일자}{해당 단란주점 인허가일자}
#'    \item{인허가취소일자}{해당 단란주점 인허가취소일자}
#'    \item{영업상태구분코드}{해당 단란주점 영업상태구분코드
#'    1 : 영업/정상}
#'    \item{영업상태명}{해당 단란주점 영업상태명}
#'    \item{상세영업상태코드}{해당 단란주점  상세영업상태코드
#'    1 : 영업}
#'    \item{상세영업상태명}{해당 단란주점 상세영업상태명}
#'    \item{폐업일자}{해당 단란주점 폐업일자}
#'    \item{휴업시작일자}{해당 단란주점 휴업시작일자}
#'    \item{휴업종료일자}{해당 단란주점 휴업종료일자}
#'    \item{재개업일자}{해당 단란주점 재개업일자}
#'    \item{소재지전화}{해당 단란주점 전화}
#'    \item{소재지면적}{해당 단란주점 면적}
#'    \item{소재지우편번호}{해당 단란주점 우편번호}
#'    \item{소재지전체주소}{해당 단란주점 전체 주소}
#'    \item{도로명전체주소}{해당 단란주점 도로명 전체 주소}
#'    \item{도로명우편번호}{해당 단란주점 도로명우편번호}
#'    \item{사업장명}{해당 단란주점 사업장명}
#'    \item{최종수정시점}{최종 수정 시점}
#'    \item{데이터갱신구분}{데이터갱신구분
#'    I , U}
#'    \item{데이터갱신일자}{데이터갱신일자}
#'    \item{업태구분명}{해당 단란주점 업태구분명 : 단란주점}
#'    \item{좌표정보.x.}{해당 단란주점 x 좌표정보}
#'    \item{좌표정보.y.}{해당 단란주점 y 좌표정보}
#'    \item{위생업태명}{해당 단란주점 위생업태명}
#'    \item{남성종사자수}{해당 단란주점 남성종사자수}
#'    \item{여성종사자수}{해당 단란주점 여성종사자수}
#'    \item{영업장주변구분명}{해당 단란주점 영업장 주변 구분 분류
#'    아파트지역, 기타, 유흥업소밀집지역, 결혼예식장주변, 학교정화(상대), 주택가주변, 학교정화(절대)}
#'    \item{등급구분명}{해당 단란주점 등급
#'    우수, 기타, 자율, 지도, 관리, 을, 갑}
#'    \item{급수시설구분명}{해당 단란주점 급수시설
#'    상수도전용, 지하수전용, 간이상수도, 상수도(음용)지하수(주방용)겸용, 전용상수도(특정시설의 자가용 수도)}
#'    \item{총종업원수}{해당 단란주점 총종업원수}
#'    \item{본사종업원수}{해당 단란주점 본사종업원수}
#'    \item{공장사무직종업원수}{해당 단란주점 공장사무직종업원수}
#'    \item{공장판매직종업원수}{해당 단란주점 공장판매직종업원수}
#'    \item{공장생산직종업원수}{해당 단란주점 공장생산직종업원수}
#'    \item{건물소유구분명}{해당 단란주점 건물소유구분명}
#'    \item{보증액}{해당 단란주점 보증액}
#'    \item{월세액}{해당 단란주점 월세액}
#'    \item{다중이용업소여부}{해당 단란주점 다중이용업소 여부 구분
#'    Y : 다중이용업소 , N : 다중이용업소 아님}
#'    \item{시설총규모}{해당 단란주점 시설총규모}
#'    \item{전통업소지정번호}{해당 단란주점 전통업소지정번호}
#'    \item{전통업소주된음식}{해당 단란주점 전통업소주된음식}
#'    \item{홈페이지}{해당 단란주점 홈페이지}
#'  }
#' @source \url{https://www.data.go.kr/data/15045017/fileData.do}
#' @examples
#' DT::datatable(head(karaoke,50))
"karaoke"





#' 소방청 화재통계
#' 
#' 소방청에서 제공하는 장소별 원인별 화재통계.
#'
#' @format A list with 18 data frame.
#' \describe{
#'    \item{연번}{해당 화재 연번}
#'    \item{사망}{해당 화재 사망}
#'    \item{부상}{해당 화재 부상}
#'    \item{인명피해.명.소계}{해당 화재 인명피해 소계}
#'    \item{재산피해소계}{해당 화재 재산피해소계}
#'    \item{시도}{해당 화재의 시 또는 도}
#'    \item{시군구}{해당 화재의 시 또는 군,구}
#'    \item{읍면동}{해당 화재의 읍 또는 면,동}
#'    \item{발화열원}{해당 화재의 발화열원
#'    작동기기, 담뱃불, 라이터불, 미상(발화원인), 불꽃, 불티, 마찰, 전도, 복사, 화학적 발화열, 폭발물, 폭죽, 기타(발화원인), 자연적 발화열}
#'    \item{발화열원소분류}{해당 화재의 발화열원소분류
#'    전기적 아크(단락), 담뱃불, 기기 전도,복사열, 미상, 모닥불, 연탄, 숯, 라이터불, 성냥불, 마찰열,마찰 스파크, 촛불, 기타(불꽃,불티), 화학반응열, 폭죽, 기타(작동기기), 굴뚝(연통) 아궁이, 불꽃, 스파크, 정전기, 화염 전도,복사열, 용접, 절단, 연마, 비화, 기타, 기타(마찰,전도,복사), 쓰레기, 논밭두렁, 기타(담뱃불,라이터불), 햇볕, 역화, 폭탄, 탄약, 향불, 낙뢰}
#'    \item{발화요인대분류}{해당 화재의 발화요인대분류
#'    전기적 요인, 부주의, 기계적 요인, 미상, 방화의심, 화학적 요인, 기타, 자연적인 요인, 교통사고, 방화, 가스누출(폭발)}
#'    \item{발화요인소분류}{해당 화재의 발화요인소분류
#'    접촉불량에 의한 단락, 담배꽁초, 음식물 조리중, 과열, 과부하, 미상, 불씨,불꽃,화원방치, 절연열화에 의한 단락, 방화의심, 미확인단락, 기타(화학적요인), 폭죽놀이, 자동제어 실패, 가연물 근접방치, 반단선, 기타(부주의), 기타, 압착,손상에 의한 단락, 기타(전기적요인), 과부하/과전류, 누전,지락, 용접, 절단 등}
#'    \item{최초착화물대분류}{해당 화재의 최초착화물대분류
#'    최초착화물 : 발화열원에 의해 불이 붙고 이 물질을 통해 제어하기 힘든 화세로 발전한 가연물
#'    전기,전자, 기타, 침구,직물류, 종이,목재,건초등, 식품, 자동차,철도차량,선박,항공기, 미상, 쓰레기류, 합성수지, 간판,차양막등, 가구, 위험물등, 가연성가스}
#'    \item{최초착화물소분류}{해당 화재의 최초착화물소분류
#'    최초착화물 : 발화열원에 의해 불이 붙고 이 물질을 통해 제어하기 힘든 화세로 발전한 가연물
#'    기타(종이,목재,건초등), 음식물, 벨트, 종이, 미상, 풀, 나뭇잎, 기타 쓰레기, 쓰레기, 건초, 합성고무(타이어), 톱밥, 기타(자동차,철도차량,선박,항공기), 목재, 합판, 전기, 전자기기 기판, 나무, 분진, 기타(간판,차양막등), 플라스틱, PVC, 비닐, 장판, 의류, 잔디, 부품, 타이어, 전기 등}
#'    \item{장소대분류}{해당 화재의 장소대분류
#'    주거, 임야, 자동차,철도차량, 판매,업무시설, 생활서비스, 기타, 산업시설, 기타서비스, 운수자동차시설, 집합시설, 교육시설, 의료,복지시설, 선박,항공기, 위험물,가스제조소, 문화재시설}
#'    \item{장소중분류}{해당 화재의 장소중분류
#'    단독주택, 들불, 자동차, 일반업무, 공동주택, 오락시설, 야외, 일상서비스, 공장시설, 판매시설, 음식점, 동식물시설, 산불, 위락시설, 기타건축물, 기타주택, 작업장, 도로, 창고시설, 자동차시설, 숙박시설, 종교시설, 학교, 의료시설, 노유자시설, 건설기계, 건강시설, 운동시설, 발전시설, 역사,터미널, 공공기관, 위생시설, 연구,학원 등}
#'    \item{장소소분류}{해당 화재의 장소소분류
#'    단독주택, 기타 들불, 오토바이, 일반빌딩, 다세대주택, 승용자동차, PC방(인터넷게임제공업), 기타야외, 기타 일상서비스, 쓰레기, 아파트, 금속기계 및 기구공업, 그 밖의 공업, 상점가, 커피숍,다방,카페(휴게), 노래연습장, 치킨,족발 등}
#'    \item{지번동}{해당 화재의 지번동}
#' }
#' @source \url{https://www.data.go.kr/data/3038724/fileData.do}
#' @examples
#' DT::datatable(head(fire,50))
"fire"






#' 식품의약품안전처 식품영양성분 데이터베이스
#' 
#' 식품의약품안전처에서 제공하는 농축수산물, 가공식품 및 음식 영양성분 데이터베이스. 이용허락범위: 저작자표시(CC BY). 
#' 본 저작물은 '식품의약품안전처'에서 '2020년'작성하여 공공누리 제1유형으로 개방한 '식품영양성분 데이터베이스를'을 이용하였으며, 
#' 해당 저작물은 '식품의약품안전처 식품영양성분 데이터베이스(https://www.foodsafetykorea.go.kr/fcdb/index.do)'에서 무료로 다운받으실 수 있습니다.
#'
#' @format A list with 146 data frame.
#' \describe{
#'    \item{no}{순번}
#'    \item{sample_id}{sample_id}
#'    \item{식품코드}{해당식품의 식품코드}
#'    \item{db_군}{농축산물}
#'    \item{상용제품}{해당식품의 상용제품
#'    품목대표}
#'    \item{식품명}{해당식품의 식품명}
#'    \item{연도}{해당식품의 조사 연도
#'    2019, 2020, 2021}
#'    \item{지역_제조사}{해당식품의 제조사 지역
#'    전국(대표)}
#'    \item{채취시기}{해당식품의 채취시기
#'    평균}
#'    \item{식품대분류}{해당식품의 식품대분류
#'    농축산물}
#'    \item{식품상세분류}{해당식품의 식품상세분류
#'    곡류 및 그 제품, 감자 및 전분류, 당류, 두류, 견과류 및 종실류, 채소류, 버섯류, 과실류, 육류, 난류, 어패류 및 기타 수산물, 해조류, 우유 및 유제품류, 유지류, 차류, 음료류, 주류, 조미료류, 조리가공품류, 기타}
#'    \item{x1회제공량}{해당식품의 1회 제공량
#'    100}
#'    \item{내용량_단위}{해당식품 내용량의 단위 : g}
#'    \item{에너지}{해당식품의 에너지(1회제공량당)}
#'    \item{수분_g}{해당식품의 수분(1회제공량당)}
#'    \item{단백질_g}{해당식품의 단백질_g(1회제공량당)}
#'    \item{지방_g}{해당식품의 지방_g(1회제공량당)}
#'    \item{탄수화물_g}{해당식품의 탄수화물_g(1회제공량당)}
#'    \item{총당류_g}{해당식품의 총당류_g(1회제공량당)}
#'    \item{자당_g}{해당식품의 자당_g(1회제공량당)}
#'    \item{포도당_g}{해당식품의 포도당_g(1회제공량당)}
#'    \item{과당_g}{해당식품의 과당_g(1회제공량당)}
#'    \item{유당_g}{해당식품의 유당_g(1회제공량당)}
#'    \item{맥아당_g}{해당식품의 맥아당_g(1회제공량당)}
#'    \item{갈락토오스_g}{해당식품의 갈락토오스_g(1회제공량당)}
#'    \item{총_식이섬유_g}{해당식품의 총 식이섬유_g(1회제공량당)}
#'    \item{수용성_식이섬유_g}{해당식품의 수용성 식이섬유_g(1회제공량당)}
#'    \item{불용성_식이섬유_g}{해당식품의 불용성 식이섬유_g(1회제공량당)}
#'    \item{칼슘}{해당식품의 칼슘(1회제공량당)}
#'    \item{철}{해당식품의 철(1회제공량당)}
#'    \item{마그네슘}{해당식품의 마그네슘(1회제공량당)}
#'    \item{인}{해당식품의 인(1회제공량당)}
#'    \item{칼륨}{해당식품의 칼륨(1회제공량당)}
#'    \item{나트륨}{해당식품의 나트륨(1회제공량당)}
#'    \item{아연}{해당식품의 아연(1회제공량당)}
#'    \item{구리}{해당식품의 구리(1회제공량당)}
#'    \item{망간}{해당식품의 망간(1회제공량당)}
#'    \item{셀레늄}{해당식품의 셀레늄(1회제공량당)}
#'    \item{몰리브덴}{해당식품의 몰리브덴(1회제공량당)}
#'    \item{요오드}{해당식품의 요오드(1회제공량당)}
#'    \item{레티놀}{해당식품의 레티놀(1회제공량당)}
#'    \item{베타카로틴}{해당식품의 베타카로틴(1회제공량당)}
#'    \item{비타민_d_d2_d3}{해당식품의 비타민 d_d2_d3(1회제공량당)}
#'    \item{비타민_d2}{해당식품의 비타민 d2(1회제공량당)}
#'    \item{비타민_d3}{해당식품의 비타민 d3(1회제공량당)}
#'    \item{비타민_e}{해당식품의 비타민 e(1회제공량당)}
#'    \item{알파_토코페롤}{해당식품의 알파 토코페롤(1회제공량당)}
#'    \item{베타_토코페롤}{해당식품의 베타 토코페롤(1회제공량당)}
#'    \item{감마_토코페롤}{해당식품의 감마 토코페롤(1회제공량당)}
#'    \item{델타_토코페롤}{해당식품의 델타 토코페롤(1회제공량당)}
#'    \item{알파_토코트리에놀}{해당식품의 알파 토코트리에놀(1회제공량당)}
#'    \item{베타_토코트리에놀}{해당식품의 베타 토코트리에놀(1회제공량당)}
#'    \item{감마_토코트리에놀}{해당식품의 감마 토코트리에놀(1회제공량당)}
#'    \item{델타_토코트리에놀}{해당식품의 델타 토코트리에놀(1회제공량당)}
#'    \item{비타민_k}{해당식품의 비타민 k(1회제공량당)}
#'    \item{비타민_k1}{해당식품의 비타민 k1(1회제공량당)}
#'    \item{비타민_k2}{해당식품의 비타민 k2(1회제공량당)}
#'    \item{비타민_b1}{해당식품의 비타민 b1(1회제공량당)}
#'    \item{비타민_b2}{해당식품의 비타민 b2(1회제공량당)}
#'    \item{나이아신}{해당식품의 나이아신(1회제공량당)}
#'    \item{나이아신_ne}{해당식품의 나이아신_ne(1회제공량당)}
#'    \item{니코틴산}{해당식품의 니코틴산(1회제공량당)}
#'    \item{니코틴아마이드}{해당식품의 니코틴아마이드(1회제공량당)}
#'    \item{판토텐산}{해당식품의 판토텐산(1회제공량당)}
#'    \item{비타민_b6}{해당식품의 비타민 b6(1회제공량당)}
#'    \item{피리독신}{해당식품의 피리독신(1회제공량당)}
#'    \item{비오틴}{해당식품의 비오틴(1회제공량당)}
#'    \item{엽산_dfe}{해당식품의 엽산 dfe(1회제공량당)}
#'    \item{엽산_천연_엽산}{해당식품의 엽산 천연 엽산(1회제공량당)}
#'    \item{엽산_합성_엽산}{해당식품의 엽산 합성 엽산(1회제공량당)}
#'    \item{비타민_b12}{해당식품의 비타민 b12(1회제공량당)}
#'    \item{비타민_c}{해당식품의 비타민 c(1회제공량당)}
#'    \item{총_아미노산}{해당식품의 총 아미노산(1회제공량당)}
#'    \item{필수_아미노산}{해당식품의 필수 아미노산(1회제공량당)}
#'    \item{이소류신}{해당식품의 이소류신(1회제공량당)}
#'    \item{류신}{해당식품의 류신(1회제공량당)}
#'    \item{라이신}{해당식품의 라이신(1회제공량당)}
#'    \item{메티오닌}{해당식품의 메티오닌(1회제공량당)}
#'    \item{페닐알라닌}{해당식품의 페닐알라닌(1회제공량당)}
#'    \item{트레오닌}{해당식품의 트레오닌(1회제공량당)}
#'    \item{트립토판}{해당식품의 트립토판(1회제공량당)}
#'    \item{발린}{해당식품의 발린(1회제공량당)}
#'    \item{히스티딘}{해당식품의 히스티딘(1회제공량당)}
#'    \item{아르기닌}{해당식품의 아르기닌(1회제공량당)}
#'    \item{비필수_아미노산}{해당식품의 비필수 아미노산(1회제공량당)}
#'    \item{티로신}{해당식품의 티로신(1회제공량당)}
#'    \item{시스테인}{해당식품의 시스테인(1회제공량당)}
#'    \item{알라닌}{해당식품의 알라닌(1회제공량당)}
#'    \item{아스파르트산}{해당식품의 아스파르트산(1회제공량당)}
#'    \item{글루탐산}{해당식품의 글루탐산(1회제공량당)}
#'    \item{글리신}{해당식품의 글리신(1회제공량당)}
#'    \item{프롤린}{해당식품의 프롤린(1회제공량당)}
#'    \item{세린}{해당식품의 세린(1회제공량당)}
#'    \item{타우린}{해당식품의 타우린(1회제공량당)}
#'    \item{콜레스테롤}{해당식품의 콜레스테롤(1회제공량당)}
#'    \item{총_지방산_g}{해당식품의 총 지방산_g(1회제공량당)}
#'    \item{총_필수_지방산_g}{해당식품의 총 필수 지방산_g(1회제공량당)}
#'    \item{총_포화_지방산_g}{해당식품의 총 포화 지방산_g(1회제공량당)}
#'    \item{부티르산_4_0}{해당식품의 부티르산 4_0(1회제공량당)}
#'    \item{카프로산_6_0}{해당식품의 카프로산 6_0(1회제공량당)}
#'    \item{카프릴산_8_0}{해당식품의 카프릴산 8_0(1회제공량당)}
#'    \item{카프르산_10_0}{해당식품의 카프르산 10_0(1회제공량당)}
#'    \item{라우르산_12_0}{해당식품의 라우르산 12_0(1회제공량당)}
#'    \item{트라이데칸산_13_0}{해당식품의 트라이데칸산 13_0(1회제공량당)}
#'    \item{미리스트산_14_0}{해당식품의 미리스트산 14_0(1회제공량당)}
#'    \item{펜타데칸산_15_0}{해당식품의 펜타데칸산 15_0(1회제공량당)}
#'    \item{팔미트산_16_0}{해당식품의 팔미트산 16_0(1회제공량당)}
#'    \item{헵타데칸산_17_0}{해당식품의 헵타데칸산 17_0(1회제공량당)}
#'    \item{스테아르산_18_0}{해당식품의 스테아르산 18_0(1회제공량당)}
#'    \item{아라키드산_20_0}{해당식품의 아라키드산 20_0(1회제공량당)}
#'    \item{헨에이코산산_21_0}{해당식품의 헨에이코산산 21_0(1회제공량당)}
#'    \item{베헨산_22_0}{해당식품의 베헨산 22_0(1회제공량당)}
#'    \item{트리코산산_23_0}{해당식품의 트리코산산 23_0(1회제공량당)}
#'    \item{리그노세르산_24_0}{해당식품의 리그노세르산 24_0(1회제공량당)}
#'    \item{총_단일_불포화지방산_g}{해당식품의 총 단일 불포화지방산_g(1회제공량당)}
#'    \item{미리스톨레산_14_1}{해당식품의 미리스톨레산 14_1(1회제공량당)}
#'    \item{팔미톨레산_16_1}{해당식품의 팔미톨레산 16_1(1회제공량당)}
#'    \item{헵타데센산_17_1}{해당식품의 헵타데센산 17_1(1회제공량당)}
#'    \item{올레산_18_1_n_9}{해당식품의 올레산 18_1_n_9(1회제공량당)}
#'    \item{박센산_18_1_n_7}{해당식품의 박센산 18_1_n_7(1회제공량당)}
#'    \item{가돌레산_20_1}{해당식품의 가돌레산 20_1(1회제공량당)}
#'    \item{에루크산_22_1}{해당식품의 에루크산 22_1(1회제공량당)}
#'    \item{네르본산_24_1}{해당식품의 네르본산 24_1(1회제공량당)}
#'    \item{총_다중_불포화지방산_g}{해당식품의 총 다중 불포화지방산_g(1회제공량당)}
#'    \item{리놀레산_18_2_n_6_c}{해당식품의 리놀레산 18_2_n_6_c(1회제공량당)}
#'    \item{알파_리놀렌산_18_3_n_3}{해당식품의 알파 리놀렌산_18_3_n_3(1회제공량당)}
#'    \item{감마_리놀렌산_18_3_n_6}{해당식품의 감마 리놀렌산_18_3_n_6(1회제공량당)}
#'    \item{에이코사디에노산_20_2_n_6}{해당식품의 에이코사디에노산 20_2_n_6(1회제공량당)}
#'    \item{에이코사트리에노산_20_3_n_3}{해당식품의 에이코사트리에노산 20_3_n_3(1회제공량당)}
#'    \item{에이코사트리에노산_20_3_n_6}{해당식품의 에이코사트리에노산 20_3_n_6(1회제공량당)}
#'    \item{아라키돈산_20_4_n_6}{해당식품의 아라키돈산 20_4_n_6(1회제공량당)}
#'    \item{에이코사펜타에노산_20_5_n_3}{해당식품의 에이코사펜타에노산 20_5_n_3(1회제공량당)}
#'    \item{도코사디에노산_22_2}{해당식품의 도코사디에노산 22_2(1회제공량당)}
#'    \item{도코사펜타에노산_22_5_n_3}{해당식품의 도코사펜타에노산 22_5_n_3(1회제공량당)}
#'    \item{도코사헥사에노산_22_6_n_3}{해당식품의 도코사헥사에노산 22_6_n_3(1회제공량당)}
#'    \item{오메가_3_지방산_g}{해당식품의 오메가 3 지방산_g(1회제공량당)}
#'    \item{오메가_6_지방산_g}{해당식품의 오메가 6 지방산_g(1회제공량당)}
#'    \item{트랜스_지방산_g}{해당식품의 트랜스 지방산_g(1회제공량당)}
#'    \item{트랜스_올레산_18_1_n_9_t}{해당식품의 트랜스 올레산_18_1_n_9_t(1회제공량당)}
#'    \item{트랜스_리놀레산_18_2t}{해당식품의 트랜스 리놀레산_18_2t(1회제공량당)}
#'    \item{트랜스_리놀렌산_18_3t}{해당식품의 트랜스 리놀렌산_18_3t(1회제공량당)}
#'    \item{식염상당량_g}{해당식품의 식염상당량_g(1회제공량당)}
#'    \item{회분_g}{해당식품의 회분_g(1회제공량당)}
#'    \item{폐기율_percent}{해당식품의 폐기율_percent(1회제공량당)}
#'    \item{성분표출처}{해당 정보의 성분표출처
#'    농진청, USDA, 식약처, 축과원, 축산연 등}
#'    \item{발행기관}{해당 정보 발행기관
#'    국립농업과학원}
#' }
#' @source \url{https://www.data.go.kr/data/15047698/fileData.do}
#' @examples
#' DT::datatable(head(foodNutrients,50))
"foodNutrients" 





#' 공공데이터활용지원센터 공공데이터포털 목록개방현황
#' 
#' 공공기관이 등록하여 공공데이터포털에서 개방중인 목록 정보(목록명, 목록타입(파일, API), 표준데이터 여부, 국가중점여부, 등록기관, 
#' 기관 분류, 분류체계, 등록일, 마지막 수정일) 를 제공. 이용허락범위 제한 없음.
#'
#' @format A list with 13 data frame.
#' \describe{
#'    \item{목록키}{해당 공공데이터 목록키}
#'    \item{목록유형}{해당 공공데이터 목록유형
#'    API, FILE, STD}
#'    \item{목록명}{해당 공공데이터 목록명}
#'    \item{목록설명}{해당 공공데이터 목록설명}
#'    \item{조회수}{해당 공공데이터 조회수}
#'    \item{분류체계}{해당 공공데이터 분류체계
#'    교통물류, 문화관광, 공공행정, 법률, 교육, 사회복지, 농축수산, 과학기술, 재난안전, 보건의료, 국토관리, 산업고용, 통일외교안보, 재정금융, 식품건강, 환경기상}
#'    \item{기관코드}{해당 공공데이터 기관코드}
#'    \item{기관명}{해당 공공데이터 기관명}
#'    \item{국가중점여부}{해당 공공데이터 국가중점여부
#'    Y, N}
#'    \item{표준데이터여부}{해당 공공데이터 표준데이터여부 Y, N}
#'    \item{목록.등록일}{해당 공공데이터 목록 등록일}
#'    \item{목록.수정일}{해당 공공데이터 목록 수정일}
#'    \item{목록.URL}{해당 공공데이터 목록 URL}
#' }
#' @source \url{https://www.data.go.kr/data/15062804/fileData.do}
#' @examples
#' DT::datatable(head(openData,50))
"openData" 





#' 한국승강기안전공단 국내 승강기 보유 현황
#' 
#' 한국승강기안전공단에서 제공하는 국내 승강기 보유 현황. 이용허락범위 제한 없음.
#'
#' @format A list with 8 data frame.
#' \describe{
#'    \item{지역}{해당 승강기 보유 건물의 지역}
#'    \item{건물명}{해당 승강기 보유 건물명}
#'    \item{건물층수}{해당 승강기 보유 건물의 건물 층수}
#'    \item{운행층수}{해당 승강기의 승강기 운행층수}
#'    \item{승강기종류}{해당 승강기종류
#'    경사형휠체어리프트, 화물용, 병원용, 승객용, 화물용(DW), 전망용, 덤웨이터, 장애인용, 무빙워크, 장애/승객화물용, 승객화물용, 장애/병원용, 소방구조/장애인용, 자동차용, 장애/전망용, 소방구조/장애/승객화물, 화물/자동차용, 소방구조용, 에스컬레이터 등}
#'    \item{건물용도_대}{해당 승강기 보유 건물용도 대분류
#'    제2종근린생활시설, 판매시설, 문화및집회시설, 공장, 업무시설, 숙박시설, 교육연구시설, 단독주택, 제1종근린생활시설, 창고시설, 방송통신시설, 공동주택, 노유자시설, 의료시설, 종교시설, 운수시설, 교정및군사시설, 운동시설, 수련시설, 발전시설, 관광휴게시설, 자동차관련시설, 위험물저장및처리시설, 묘지관련시설, 위락시설, 동식물관련시설, 자원순환관련시설, 야영장시설, 기타, 장례시설, 가설건축물}
#'    \item{정격속도_ms}{해당 승강기 정격속도}
#'    \item{대수}{해당 승강기 보유 건물의 승강기 대수}
#' }
#' @source \url{https://www.data.go.kr/data/15017366/fileData.do}
#' @examples
#' DT::datatable(head(elevator,50))
"elevator" 




#' 경찰청 범죄 발생 장소별 통계
#' 
#' 경찰청에서 제공하는 범죄유형별(강력범죄, 폭력범죄, 지능범죄 등)로 범죄장소(아파트, 단독주택, 고속도로, 노상 ,백화점, 슈퍼마켓 등)별 통계. 이용허락범위 제한 없음.
#'
#' @format A list with 4 data frame.
#' \describe{
#'    \item{범죄대분류}{해당 범죄의 대분류
#'    강력범죄, 절도범죄, 폭력범죄, 지능범죄, 풍속범죄, 특별경제범죄, 마약범죄, 보건범죄, 환경범죄, 교통범죄, 노동범죄, 안보범죄, 선거범죄, 병역범죄, 기타범죄}
#'    \item{범죄중분류}{해당 범죄의 중분류
#'    살인기수, 살인미수등, 강도, 강간, 유사강간, 강제추행, 기타 강간-강제추행등, 방화, 절도범죄, 상해, 폭행, 체포-감금, 협박, 약취-유인, 폭력행위등, 공갈, 손괴, 직무유기, 직권남용, 증수뢰, 통화, 문서-인장, 유가증권인지, 사기, 횡령, 배임, 성풍속범죄, 도박범죄, 특별경제범죄, 마약범죄, 보건범죄, 환경범죄, 교통범죄, 노동범죄, 안보범죄, 선거범죄, 병역범죄, 기타범죄}
#'    \item{장소}{해당 범죄 발생 장소
#'    아파트.연립다세대, 단독주택, 고속도로, 노상, 백화점, 슈퍼마켓, 편의점, 대형할인매장, 상점, 시장.노점, 숙박업소.목욕탕, 유흥접객업소, 사무실, 공장, 공사장.광산, 창고, 역.대합실, 지하철, 기타표통수단내, 흥행장, 유원지, 학교, 금융기관, 의료기관, 종교기관, 산야, 해상, 부대, 구금장소, 공지, 주차장, 공중화장실, 피씨방}
#'    \item{발생횟수}{해당 범죄 발생 장소의 발생횟수}
#'  }
#' @source \url{https://www.data.go.kr/data/3074463/fileData.do}
#' @examples
#' DT::datatable(head(crimePlace,50))
"crimePlace" 







#' 국토교통부 전국 버스 정류장 위치정보
#' 
#' 버스정보시스템(BIS)이 구축된 지자체 중 국가대중교통정보센터(TAGO)와 연계된 136개 지자체에 대한 버스정류장 위치정보 데이터. 안동-예천의 경우 안동, 원주-횡성은 원주, 제주-서귀포는 제주, 대전-계룡은 대전, 목포-무안-신안-영암은 목포, 영덕-청송-영양은 영덕으로 통합. 이용허락범위 제한 없음.
#'
#' @format A data frame with 11 variables.
#' \describe{
#'   \item{정류장아이디}{해당 정류장 아이디}
#'   \item{정류장.명칭}{해당 정류장 명칭}
#'   \item{정류장.유형}{정류장 유형(0:공용, 1:일반시내, 2:좌석시내, 3:직행좌석형시내, 4:일반형시외, 5:좌석형시외, 6:고속형시외, 7:마을버스)}
#'   \item{중앙차로.여부}{중앙차로 여부(Y/N)}
#'   \item{노드영문명}{노드영문명}
#'   \item{위도}{해당 정류소의 GPS 위도(WGS84)}
#'   \item{경도}{해당 정류소의 GPS 경도(WGS84)}
#'   \item{수집일시}{해당 정보 수집일시}
#'   \item{단축아이디}{모바일(ARS), 단축 아이디}
#'   \item{도시코드}{해당 정류소의 도시코드}
#'   \item{도시명}{해당 정류소의 도시명}
#'  }
#' @source \url{https://www.data.go.kr/data/15067528/fileData.do}
#' @examples
#' library(leaflet)
#' 
#' busStation |> 
#'   dplyr::filter(도시명 == "울릉군") |> 
#'   leaflet() |> 
#'   addTiles() |> 
#'   addMarkers(~경도, ~위도, popup = ~as.character(정류장.명칭), label = ~as.character(정류장.명칭))
#' @examples
#' DT::datatable(head(busStation,50))
"busStation"




#' 서울특별시 응급실 위치 정보
#' 
#' 서울특별시에서 제공하는 서울시 응급실 위치 정보. 주소, 병원분류명, 응급의료기관, 응급실운영여부, 비고, 기관설명상세, 간이약도, 기관명, 대표전화, 응급실 전화, 진료시간, 병원경도, 병원위도 등의 항목으로 구성. 본 저작물은 서울특별시에서 2021년 작성하여 공공누리 제1유형으로 개방한 '서울특별시 응급실 위치 정보(작성자:서울특별시 빅데이터담당관)'을 이용하였으며, 저작물은 '서울시 열린 데이터 광장(http://data.seoul.go.kr/dataList/OA-20338/S/1/datasetView.do)'에서 무료로 다운받으실 수 있습니다.
#'
#' @format A data frame with 34 variables.
#' \describe{
#'    \item{기관ID}{해당 병원 기관ID}
#'    \item{주소}{해당 병원 주소}
#'    \item{병원분류}{해당 병원분류
#'    A : 종합병원, B : 병원}
#'    \item{병원분류명}{해당 병원분류명
#'    종합병원, 병원}
#'    \item{응급의료기관코드}{해당 병원 응급의료기관코드
#'    G001 : 권역응급의료센터, G006 : 지역응급의료센터, G009 : 응급실운영신고기관, G007 : 지역응급의료센터 , G099 : 응급의료기관 이외}
#'    \item{응급의료기관코드명}{해당 병원 응급의료기관코드명
#'    권역응급의료센터, 지역응급의료센터, 응급실운영신고기관, 지역응급의료기관, 응급의료기관 이외}
#'    \item{응급실운영여부}{해당 병원 응급실운영여부
#'    1}
#'    \item{비고}{해당 병원 비고}
#'    \item{기관설명상세}{해당 병원 기관설명상세}
#'    \item{간이약도}{해당 병원 간이약도}
#'    \item{기관명}{해당 병원 기관명}
#'    \item{대표전화1}{해당 병원 대표전화1}
#'    \item{응급실전화}{해당 병원 응급실전화}
#'    \item{진료시간.월요일.C}{진료시간 월요일 종료시간}
#'    \item{진료시간.화요일.C}{진료시간 화요일 종료시간}
#'    \item{진료시간.수요일.C}{진료시간 수요일 종료시간}
#'    \item{진료시간.목요일.C}{진료시간 목요일 종료시간}
#'    \item{진료시간.금요일.C}{진료시간 금요일 종료시간}
#'    \item{진료시간.토요일.C}{진료시간 토요일 종료시간}
#'    \item{진료시간.일요일.C}{진료시간 일요일 종료시간}
#'    \item{진료시간.공휴일.C}{진료시간 공휴일 종료시간}
#'    \item{진료시간.월요일.S}{진료시간 월요일 오픈시간}
#'    \item{진료시간.화요일.S}{진료시간 화요일 오픈시간}
#'    \item{진료시간.수요일.S}{진료시간 수요일 오픈시간}
#'    \item{진료시간.목요일.S}{진료시간 목요일 오픈시간}
#'    \item{진료시간.금요일.S}{진료시간 금요일 오픈시간}
#'    \item{진료시간.토요일.S}{진료시간 토요일 오픈시간}
#'    \item{진료시간.일요일.S}{진료시간 일요일 오픈시간}
#'    \item{진료시간.공휴일.S}{진료시간 공휴일 오픈시간}
#'    \item{우편번호1}{해당 병원 우편번호1}
#'    \item{우편번호2}{해당 병원 우편번호2}
#'    \item{병원경도}{해당 병원 병원경도}
#'    \item{병원위도}{해당 병원 병원위도}
#'    \item{작업시간}{해당 병원 작업시간}
#' }
#' @source \url{https://www.data.go.kr/data/15088910/fileData.do}
#' @examples
#' library(leaflet)
#' 
#' seoulER |> 
#' leaflet() |> 
#'   addTiles() |> 
#'   addMarkers(~병원경도, ~병원위도, popup = ~as.character(기관명), label = ~as.character(기관명))
#' @examples
#' DT::datatable(head(seoulER,50))
"seoulER"






#' 경기도 응급의료기관 및 응급의료지원센터 현황
#' 
#' 경기도 내 응급의료기관 및 응급의료지원센터 현황. 기관 및 센터의 소재지 주소와 대표 전화번호 등의 정보를 제공. 이용허락범위 제한 없음.
#'
#' @format A data frame with 14 variables.
#' \describe{
#'    \item{시군명}{해당 응급의료기관 및 응급의료지원센터의 시 또는 군}
#'    \item{병원명/센터명}{해당 응급의료기관 및 응급의료지원센터의 병원명 또는 센터명}
#'    \item{업무구분명}{해당 응급의료기관 및 응급의료지원센터의 업무구분명
#'    응급의료지원센터, 지역기관, 지역센터, 권역센터}
#'    \item{대표전화번호}{해당 응급의료기관 및 응급의료지원센터의 대표전화번호}
#'    \item{소재지도로명주소}{해당 응급의료기관 및 응급의료지원센터의 도로명주소}
#'    \item{소재지지번주소}{해당 응급의료기관 및 응급의료지원센터의 지번주소}
#'    \item{소재지우편번호}{해당 응급의료기관 및 응급의료지원센터의 우편번호}
#'    \item{위도}{해당 응급의료기관 및 응급의료지원센터의 위도}
#'    \item{경도}{해당 응급의료기관 및 응급의료지원센터의 경도}
#'    \item{응급의료지원센터여부}{해당 응급의료기관 및 응급의료지원센터의 응급의료지원센터여부
#'    Y or NA}
#'    \item{전문응급의료센터여부}{해당 응급의료기관 및 응급의료지원센터의 전문응급의료센터여부
#'    Y or NA}
#'    \item{전문응급센터전문분야}{해당 응급의료기관 및 응급의료지원센터의 전문응급센터전문분야
#'    소아전문응급실}
#'    \item{권역외상센터여부}{해당 응급의료기관 및 응급의료지원센터의 권역외상센터여부
#'    Y or NA}
#'    \item{지역외상센터여부}{해당 응급의료기관 및 응급의료지원센터의 지역외상센터여부
#'    Y or NA}
#' }
#' @source \url{https://www.data.go.kr/data/15011313/fileData.do}
#' @examples
#' library(leaflet)
#' 
#' gyeonggiER |> 
#' leaflet() |> 
#'   addTiles() |> 
#'   addMarkers(~경도, ~위도, popup = ~as.character(`병원명/센터명`), label = ~as.character(`병원명/센터명`)) |> 
#'   addMarkers(~병원경도, ~병원위도, popup = ~as.character(기관명), label = ~as.character(기관명), data = datatoys::seoulER)
#' DT::datatable(head(gyeonggiER,50))
"gyeonggiER"






#' 경찰청 음주운전 적발 기록 현황
#' 
#' 음주운전 적발기록을 통한 음주예방을 위해 경찰처에서 공개한 자료. 이용허락범위 제한 없음.
#'
#' @format A data frame with 8 variables.
#' \describe{
#'    \item{성별}{음주운전자의 성별}
#'    \item{적발횟수}{음주운전자의 누적 적발 횟수}
#'    \item{나이}{음주운전자의 나이}
#'    \item{알콜농도}{음주운전자의 적발 당시 알콜농도}
#'    \item{측정일시}{음주운전 측정 일시 yyyy-mm-dd hh:mm:ss 형태}
#'    \item{관할경찰서}{단속 관할 경찰서 이름}
#'    \item{나이불명}{나이 불명 여부}
#'    \item{측정}{측정거부 및 정상측정}
#' }
#' @source \url{https://www.data.go.kr/data/15043308/fileData.do}
#' @examples
#' DT::datatable(head(drunkdrive))
"drunkdrive"



#' 보건복지부 주류관련 통계
#' 
#' 보건복지부 절주온에서 제공하는 주류관련 통계. 출고량, 
#'
#' @format A list with 3 data frame.
#' \describe{
#'    \item{연도}{통계기록연도}
#'    \item{종류}{술의 종류}
#'    \item{출고량_킬로리터}{종류별 출고량(단위 = kL)}
#'    \item{명목소비지출}{명목소비지출금액은 당해년 가격으로 평가한 항목으로 가격 및 물량변동 요인이 모두 반영}
#'    \item{명목주류지출}{명목주류비지출금액은 당해년 가격으로 평가한 항목으로 가격 및 물량변동 요인이 모두 반영}
#'    \item{주류비비율}{명목소비지출 대비 명목주류지출 비율}
#'    \item{성별}{사망자 성별}
#'    \item{사망자수}{연도별 알콜 관련 사망자수}
#'    \item{사망률}{인구 10만명 당 알콜관련 사망자수}
#'  }
#' @source \url{https://www.khepi.or.kr/board?menuId=MENU01152&siteId=null-}
#' @examples
#' DT::datatable(head(liquor$출고량,20))
#' 
#' DT::datatable(head(liquor$주류지출비용,20))
#' 
#' DT::datatable(head(liquor$알콜관련사망자,20))
"liquor"



#' 한국천문연구원 특일 정보
#' 
#' 한국천문연구원에서 제공하는 국경일정보, 공휴일정보, 기념일정보, 24절기정보, 잡절정보
#' 날짜, 순번, 특일정보의 분류, 공공기관 휴일 여부, 명칭 제공. 이용허락범위 제한없음.
#'
#' @format A dataframe with 11 variables.
#' \describe{
#'    \item{양력날짜}{양력 날짜로 태양의 자전과 공전 주기를 기준으로 연도를 계산}
#'    \item{음력날짜}{음력 날짜로 달의 위상과 월의 주기를 기준으로 연도를 계산}
#'    \item{음력간지년한글}{음력간지년(한글)}
#'    \item{음력간지월한글}{음력간지월(한글)}
#'    \item{음력간지일한글}{음력간지일(한글)}
#'    \item{음력간지년한자}{음력간지년(한자)}
#'    \item{음력간지월한자}{음력간지월(한자)}
#'    \item{음력간지일한자}{음력간지일(한자)}
#'    \item{율리우스적일}{율리우스력의 기원전 4713년 1월 1일 월요일 정오(세계표준시 기준)를 기점으로 계산한 날짜}
#'    \item{손없는날}{손없는날의 논리값(TRUE or FALSE)}
#'    \item{손있는날}{손있는날의 방향(동, 서, 남, 북)}
#'  }
#' @source \url{https://www.data.go.kr/data/15012690/openapi.do}
#' @examples
#' DT::datatable(head(Kcalendar))
"Kcalendar"


#' 통계청 시도/인구동태건수 및 동태율(출생,사망,혼인,이혼)
#' 
#' 통계청에서 제공하는 1990-2022년 시도별 인구동태건수 및 동태율(출생,사망,혼인,이혼). 이용허락범위 제한없음.
#'
#' @format A data frame with 13 variables.
#' \describe{
#'    \item{행정구역별}{인구조사 행정구역}
#'    \item{시점}{통계 조사 시점(연)}
#'    \item{출생건수_명}{임신주수와 관계없이 태아가 모체로부터 완전히 배출/만출한 것으로, 탯줄의 절단, 태반의 분리와 관계없이 모체로부터 분리후 생명의 증거(호흡, 심장/제대의 박동, 수의근의 명백한 움직임 등)가 있는 경우}
#'    \item{합계출산율}{한 여자가 평생동안 평균 몇 명의 자녀를 낳는가를 나타내며, 출산력 수준비교를 위해 대표적으로 활용되는 지표로서 연령별 출산율(ASFR)의 총합}
#'    \item{조출생율_천명당}{특정 인구집단의 출산수준을 나타내는 기본적인 지표로서 1년간의 총출생아 수를 당해연도의 연앙인구로 나눈 수치를 1,000분비로 나타낸 것}
#'    \item{사망건수_명}{출생후 생명의 증거(호흡, 심장/제대의 박동, 수의근의 명백한 움직임 등)가 영구적으로 전혀 나타나지 않는 경우. 즉, 인공호흡의 가능성도 없는 출산후에 나타나는 생명력의 정지상태}
#'    \item{조사망률_천명당}{한 인구집단의 사망수준을 나타내는 기본적인 지표로서 특정연도의 연간 사망자수를 당해연도의 연앙인구로 나눈 수치를 1,000분비로 나타낸 것}
#'    \item{자연증가건수_명}{출생아수에서 사망자수를 뺀 값}
#'    \item{자연증가율_천명당}{자연증가건수를 1,000분비로 나타낸 것}
#'    \item{혼인건수_건}{남편(부)과 아내(처)로 구성된 법적관계임. 법률혼주의 원칙에서 혼인신고수리의 경우와 직권에 의해 가족관계등록부기재에 의한 신고로 이뤄짐(단, 신고에 의한 것이므로 혼전 동거,별거 등 사실혼과는 차이가 있을 수 있음)}
#'    \item{조혼인율_천명당}{1년간 신고된 총 혼인건수를 당해연도의 연앙인구로 나눈 수치를 1,000분비로 나타낸 것}
#'    \item{이혼건수_건}{법률혼주의 원칙에서 이혼신고 수리에 의한 신고와 재판이혼(조정,심판 혹은 판결)의 경우는 직권에 의해서 가족관계등록부기재에 의한 신고로 이루어짐}
#'    \item{조이혼율_천명당}{1년간 신고된 총 이혼건수를 당해연도의 연앙인구로 나눈 수치를 1,000분비로 나타낸 것}
#'  }
#' @source \url{https://kosis.kr/statHtml/statHtml.do?orgId=101&tblId=DT_1B8000I&vw_cd=MT_ZTITLE&list_id=A2_6&seqNo=&lang_mode=ko&language=kor&obj_var_id=&itm_id=&conn_path=MT_ZTITLE}
#' @examples
#' DT::datatable(head(birthRate))
#' 
#' library(ggplot2)
#' library(dplyr)
#' birthRate %>% 
#'    group_by(시점) %>% 
#'    summarise(출생 = sum(출생건수_명, na.rm = TRUE)) %>% 
#'    mutate(출생 = round(출생/10000, 1)) %>% 
#'    ggplot(aes(시점, 출생)) + 
#'    geom_line() + geom_point() + 
#'    ggrepel::geom_text_repel(aes(label = 출생), vjust = -0.5) + 
#'    theme_bw(base_family = "NanumGothic") +
#'    scale_x_continuous(breaks = seq(1990, 2024, by = 5)) + 
#'    labs(title = "연도별 출생아수", subtitle = "1990-2022년", x = "", y = "출생아수(만명)")

"birthRate"




#' 서울교통공사 지하철혼잡도정보
#' 
#' 서울교통공사 1-8호선 30분 단위 평균 혼잡도로 30분간 지나는 열차들의 평균 혼잡도(정원대비 승차인원으로, 승차인과 좌석수가 일치할 경우를 혼잡도 34%로 산정) 제공(단위: %). 요일구분(평일, 토요일, 일요일), 호선, 역번호, 역명, 상하선구분, 30분단위 별 혼잡도 데이터로 구성되어 있음. 1년 단위 업데이트. 이용허락범위 제한없음.
#'
#' @format A data frame with 7 variables.
#' \describe{
#'    \item{요일구분}{평일, 토요일, 공휴일 등 요일 구분}
#'    \item{호선}{지하철 호선 번호}
#'    \item{역번호}{외부역 코드}
#'    \item{출발역}{출발역 이름}
#'    \item{상하구분}{운행 방향}
#'    \item{시간}{기준 시간으로 30분 단위로 집계}
#'    \item{혼잡도}{30분 단위 평균 혼잡도로 30분간 지나는 열차들의 평균 혼잡도}
#'  }
#' @source \url{https://www.data.go.kr/data/15071311/fileData.do}
#' @examples
#' DT::datatable(head(busyMetro))
#' 
#' busyMetro %>% 
#'    filter(요일구분 == "평일") %>% 
#'    filter(호선 == 2) %>% 
#'    mutate(출발역 = paste(호선, "호선", 출발역)) %>% 
#'    ggplot(aes(시간, 혼잡도, color = 상하구분)) +
#'    geom_line(aes(group = 상하구분)) +
#'    scale_color_manual(values = c("#E966A0", "#213363", "#8EAC50", "#F2BE22")) +
#'    facet_wrap(. ~출발역, ncol = 10, strip.position = "bottom") +
#'    ggthemes::theme_tufte(base_family = "NanumGothic") +
#'    theme(
#'        axis.text = element_blank(),
#'        axis.ticks = element_blank(),
#'        axis.title = element_blank(),
#'        legend.position = "bottom"
#'        ) +
#'    labs(title = "서울교통공사 2호선 시간대별 지하철 혼잡도 분포", subtitle = "평일 05:30 ~ 00:30")

"busyMetro"




#' 기획재정부 연도별 세출 및 지출 예산현황
#' 
#' 2023년 정부 연도별 세출/지출 예산편성 현황(총액), 기금운용계획안. 이용허락범위 제한 없음.
#'
#' @format A data frame with 13 variables.
#' \describe{
#'    \item{회계연도}{회계상의 정리기술면에서 편의에 따라 일정한 기간을 정하고 그 수지상황을 명확히 하는 예산의 기간적 단위. 우리나라의 경우에 현행 국가재정법법 제2조에 따라 매년 1월1일에 시작하여 12월 31일에 종료.}
#'    \item{소관명}{국가의 업무 담당하여 관리하는 부, 처, 청, 위원회 등 정부조직법상 중앙행정기관과 헌법기관의 이름}
#'    \item{회계명}{정보를 제공하기 위한 일련의 과정 또는 체계. 일반회계는 조세수입 등을 주요 세입으로 하여 국가의 일반적인 세출에 충당하기 위하여 설치하며 특별회계는 국가에서 특정한 사업을 운영하고자 할 때, 특정한 자금을 보유하여 운용하고자 할 때, 특정한 세입으로 특정한 세출에 충당함으로써 일반회계와 구분하여 회계처리할 필요가 있을 때에 법률로써 설치}
#'    \item{계정명}{회계에 있어서 재산의 모든 변동을 종합적, 유기적으로 파악하여 기록하고 계산하기 위한 특수형식.국가재정에서는 일반적인 의미의 계정(account, 계정과목)이외에 세입세출 예산을 구분하기위한 계정이 존재(국가재정법 제21조)}
#'    \item{분야명}{프로그램 예산제도에 따른 세출예산 분류 체계(분야-부문-프로그램-단위사업-세부사업)의 최상위 단위}
#'    \item{부문명}{프로그램 예산제도에 따른 세출예산 분류 체계(분야-부문-프로그램-단위사업-세부사업)의 한 단위}
#'    \item{프로그램명}{프로그램 예산제도에 따른 세출예산 분류 체계(분야-부문-프로그램-단위사업-세부사업)의 한 단위. 국가의 최소 정책단위로서 동일한 정책목표를 달성하기 위한 한 개 이상의 단위사업으로 구성}
#'    \item{단위사업명}{프로그램 예산제도에 따른 세출예산 분류 체계(분야-부문-프로그램-단위사업-세부사업)의 한 단위로 프로그램(정책) 달성을 위한 세부사업군(群)으로 구성 (예: 수산물 가격 안정)}
#'    \item{세부사업명}{프로그램 예산제도에 따른 세출예산 분류 체계(분야-부문-프로그램-단위사업-세부사업)의 최하위 단위로 행정과목에 해당}
#'    \item{경비구분}{인건비, 기본경비 등 경비 구분}
#'    \item{지출구분}{일반지출, 보전 지출 등 지출 구분}
#'    \item{정부안금액_천원}{각 중앙관서의 장이 제출한 예산 요구서에 대한 검토 및 조정 작업(예산안 편성)을 거쳐 예산안 시안이 마련되면 기획재정부는 대통령 중간보고, 당정협의, 예산자문회의 등을 거쳐 정부의 최종 예산안을 마련}
#'    \item{국회확정금액_천원}{국회에서 확정된 최종 금액}
#'  }
#' @source \url{https://www.data.go.kr/data/15071311/fileData.do}
#' @examples
#' DT::datatable(head(budget2023))

"budget2023"




#' 중앙선거관리위원회 국회의원선거 개표결과 정보
#' 
#' 2020년도 전국 시도, 구시군, 읍면동, 투표구별 국회의원선거의 개표정보. 이용허락범위 제한 없음.
#'
#' @format A data frame with 8 variables.
#' \describe{
#'    \item{구분}{비례대표, 국회의원 및 보궐선거}
#'    \item{지역구명}{시군구 지역구 이름}
#'    \item{읍면동명}{읍면동 이름}
#'    \item{투표구명}{투표구 이름}
#'    \item{선거인수}{선거권이 있는 사람으로서 선거인명부 또는 재외선거인명부에 올라 있는 사람의 수}
#'    \item{투표수}{선거인 중 투표에 참여한 사람의 수}
#'    \item{정당}{투표 정당 및 후보자 이름}
#'    \item{득표}{득표 수}
#'  }
#' @source \url{https://www.data.go.kr/data/15025527/fileData.do}
#' @examples
#' DT::datatable(head(election2020))

"election2020"


#' 행전안전부 가축사육업 로컬데이터
#' 
#' 가축을 사육하여 판매하거나 젖·알·꿀을 생산하는 업소정보. 이용허락범위 제한 없음.
#'
#' @format A data frame with 34 variables.
#' \describe{
#'    \item{}{}
#'  }
#' @source \url{https://www.localdata.go.kr/devcenter/dataDown.do?menuNo=20001}
#' @examples
#' DT::datatable(head(farmGIS))
#' library(sf)
#' library(tidyverse)
#' library(leaflet)
#' library(inlmisc)
#' 
#' farm <- farmGIS %>% 
#'   separate(col = "도로명전체주소", into = c("시도", "시군구"), sep = " ") %>% 
#'   filter(주사육업종 == "한우") %>%
#'   filter(영업상태명 == "영업/정상") %>% 
#'   mutate(
#'     x = as.numeric(좌표정보_x),
#'     y = as.numeric(좌표정보_y),
#'     idx = row_number()
#'   ) %>% 
#'   select(사업장명, x, y, idx) %>% 
#'   filter(!is.na(y)) %>% 
#'   st_as_sf(coords = c("x", "y"), crs = 5174) %>% 
#'   st_transform(4326)
#' 
#' leaflet() %>% 
#'   addTiles() %>% 
#'   addMarkers(data = farm, label = ~as.character(사업장명), clusterOptions = markerClusterOptions(), group="marker") %>% 
#'   inlmisc::AddSearchButton(group = "marker", zoom = 15, textPlaceholder = "Search here")

"farmGIS"




#' 서울특별시 사회적 약자를 위한 위로의 글
#' 
#' 인터넷에 흩어져 있는 좋은 글이나 이미지 발견 시 수집하여 상황에 맞게 레이블링을 수행. 개인, 민간기업 등이 인공지능 학습, 연구, 기술개발 등에 활용할 수 있으나, 학습데이터에 기반한 인공지능 제품개발, 기술연구 논문 등의 결과물에는 데이터의 출처가 서울시 열린데이터광장 임을 명기 필요.
#'
#' @format A data frame with 3 variables.
#' \describe{
#'    \item{상황}{위로받는 이의 상황에 대한 설명}
#'    \item{위로글내용}{위로하는 내용}
#'    \item{url}{원문출처 url}
#'  }
#' @source \url{https://data.seoul.go.kr/etc/aiEduData.do}
#' @examples
#' 
#' dplyr::glimpes(cheerUp)
#' 
#' library(tidytext)
#' library(ggwordcloud)
#' library(dplyr)
#' library(datatoys)
#' 
#' cheerUp %>% 
#'   unnest_tokens(input = 위로글내용, output = word, token = "words") %>% 
#'   count(word, sort = TRUE) %>% 
#'   filter(nchar(word) > 1) %>% 
#'   head(100) %>% 
#'   ggplot(aes(label = word, size = n)) +
#'   geom_text_wordcloud(seed = 811, family = "NanumGothic")

"cheerUp"



#' 서울특별시 2022년 서울 시민생활 데이터
#' 
#' 서울시와 SK텔레콤이 공공빅데이터와 통신데이터 가명결합을 통해 추정한 서울 행정동단위 성, 연령별 1인가구와 서울시민의 생활특성 정보. 데이터 명세 및 자세한 정보는 아래 url을 통해 제공. 개인, 민간기업 등이 인공지능 학습, 연구, 기술개발 등에 활용할 수 있으나, 학습데이터에 기반한 인공지능 제품개발, 기술연구 논문 등의 결과물에는 데이터의 출처가 서울시 열린데이터광장 임을 명기 필요.
#'
#' @format A data frame with 147 variables.
#' \describe{
#'    \item{}{}
#'  }
#' @source \url{https://data.seoul.go.kr/dataVisual/seoul/seoulLiving.do}
#' @examples
#' dplyr::glimpse(seoulCivic)

"seoulCivic"