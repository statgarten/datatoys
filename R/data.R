#' @importFrom tibble tibble
NULL

#' odaKR
#'
#' 한국국제협력단에서 제공하는 소득수준별 ODA 실적통계로 1991년부터 2019년까지의 연도별, 
#' 사업분류별, 지원액(원화), 지원액(달러)
#' https://www.data.go.kr/data/15060094/fileData.do
#'
#' @format A data frame with four variables: \code{연도}, \code{사업분류},
#'   \code{지원액_원화}, and \code{지원액_달러}.
"odaKR"




#' accident
#'
#' 도로교통공단에서 제공하는 사망 교통사고에 대한 개별정보(발생일시, 사고유형, 위치좌표 등)
#' 부상자수 = 중상자수 + 경상자수 + 부상신고자수
#' https://www.data.go.kr/data/15070340/fileData.do
#'
#' @format A data frame with 23 variables: \code{발생년}, \code{발생년월일시},
#'   \code{주야}, \code{요일}, \code{사망자수}, \code{부상자수}, \code{중상자수}, \code{경상자수},
#'   \code{부상신고자수}, \code{발생지시도}, \code{발생지시군구}, \code{사고유형_대분류}, \code{사고유형_중분류}, 
#'   \code{사고유형}, \code{가해자법규위반}, \code{도로형태_대분류}, \code{도로형태}, \code{가해자_당사자종별},
#'   \code{피해자_당사자종별}, \code{발생위치X_UTMK}, \code{발생위치Y_UTMK}, \code{경도}, and \code{위도}.
"accident"




#' pollution
#'
#' 국립환경과학원에서 제공하는 축산계 오염원에 대한 조사정보
#' https://www.data.go.kr/data/3045217/fileData.do
#'
#' @format A data frame with 18 variables: \code{법정동코드}, \code{시도},
#'   \code{시군구}, \code{읍면동}, \code{리}, \code{축종}, \code{법적규제}, \code{사육두수.두.},
#'   \code{농가수.호.}, \code{가축분뇨발생량.m3.일.}, \code{자가처리_정화방류.m3.일.}, \code{자가처리_퇴비화.m3.일.}, 
#'   \code{자가처리_액비화.m3.일.}, \code{미처리.m3.일.}, \code{위탁처리_공공처리시설.m3.일.}, \code{위탁처리_공동처리시설.m3.일.}, 
#'   \code{위탁처리_재활용신고자.m3.일.}, and \code{위탁처리_가축분뇨처리업.m3.일.}.
"pollution"




#' crime
#'
#' 전국 경찰관서에 고소, 고발, 인지 등으로 형사입건된 사건의 발생, 검거, 피의자에 대한 지역별 분석 현황
#' 범죄대분류, 범죄중분류, 서울, 부산, 대구, 인천, 광주, 대전 울산, 세종, 경기도 지역으로 구분하여 발생 건수 제공
#' https://www.data.go.kr/data/3074462/fileData.do
#' 
#' @format A data frame with 90 variables.
"crime"




#' scholarship
#'
#' 한국장학재단에서 제공하는 전년도 장학금 수혜현황(대학정보공시 항목) 조사를 통해, 대학별 재원구분에 따른 교외장학금 수혜 금액 및 
#' 성격유형에 따른 교내장학금 수혜금액 제공. 2020 회계연도부터 재난을 사유로 지급한 교내장학금 추가 조사.
#' https://www.data.go.kr/data/15038576/fileData.do
#'
#' @format A data frame with 16 variables.
"scholarship"




#' medicalCheckup
#'
#' 국민건강보험의 직장가입자와 40세 이상의 피부양자, 세대주인 지역가입자와 40세 이상의 지역가입자의 일반건강검진 결과와 이들 일반건강검진 
#' 대상자 중에 만40세와 만66세에 도달한 이들이 받게 되는 생애전환기건강진단 수검이력이 있는 각 연도별 수진자 100만 명에 대한 
#' 기본정보(성, 연령대, 시도코드 등)와 검진내역(신장, 체중, 총콜레스테롤, 혈색소 등)으로 구성된 개방데이터
#' https://www.data.go.kr/data/15007122/fileData.do
#'
#' @format A data frame with 31 variables.
"medicalCheckup"




#' gasStation
#'
#' 산업통상자원부에서 제공하는 전국 주유소 등록현황(전국 주유소 신규 등록 , 휴업, 폐업 현황 정보, 연도, 변동사유발생연월일, 판매업종류 등). 
#' Last Update: 2022-03-10;
#' https://www.data.go.kr/data/3076606/fileData.do
#'
#' @format A data frame with 6 variables.
"gasStation"




#' housingPrice
#'
#' 국토교통부에서 제공하는 2021년도 공동주택 공시가격정보입니다. 
#' Last Update: 2021-10-29;
#' https://www.data.go.kr/data/3073746/fileData.do
#'
#' @format A data frame with 20 variables.
"housingPrice"




#' restaurant
#'
#' 경기도 지역 특산물을 활용한 향토 특색음식점으로 경기도를 대표할 수 있는 맛, 위생, 서비스가 우수한 업소를 발굴하여 
#' 경기으뜸맛집으로 육성하고자 선정된 맛집 현황입니다. 음식점명, 맛집전화번호, 대표음식명, 주소, 위경도 등의 정보를 제공합니다.
#' Last Update: 2017-11-20;
#' https://www.data.go.kr/data/15057234/openapi.do
#'
#' @format A data frame with 9 variables.
"restaurant"




#' nationalPension
#'
#' 국민연금공단에서 제공하는 법정동단위 지역별, 국민연금 가입 사업장 정보(단, 개인사업장 및 2인 이하 법인 사업장 정보 미제공).
#' Last Update: 2022-05-18;
#' https://www.data.go.kr/data/15083277/fileData.do
#'
#' @format A data frame with 22 variables.
"nationalPension"




#' postOffice
#'
#' 서울특별시 우체국 정보에 대한 데이터로 전체기관명, 대표 전화번호, 새우편번호, 도로명주소, 행정시, 행정구, 행정동 정보.
#' Last Update: 2021-05-27;
#' https://www.data.go.kr/data/15047367/fileData.do
#'
#' @format A data frame with 14 variables.
"postOffice"




#' medicine
#'
#' 건강보험심사평가원에서 제공하는 의약품 주성분(일반명) 현황에 대한 데이터셋. 
#' 의약품주성분 코드, 성분명, 제형구분, 투여, 함량, 단위 등 정보를 제공.
#' Last Update: 2021-10-25;
#' https://www.data.go.kr/data/15067461/fileData.do
#'
#' @format A data frame with 8 variables.
"medicine"




#' necessariesPrice
#'
#' 한국소비자원 참가격정보서비스에 접수된 상품별 생필품 가격 데이터 현황(상품명, 판매업소, 판매가격 등).
#' Last Update: 2022-05-23;
#' https://www.data.go.kr/data/15083256/fileData.do
#'
#' @format A data frame with 7 variables.
"necessariesPrice"




#' globalBusiness
#'
#' 대한무역투자진흥공사에서 제공하는 전세계 124개국의 해외진출기업의 회사명, 주소, 홈페이지, 진출년도, 진출형태, 투자형태 등의 정보.
#' Last Update: 2021-09-27;
#' https://www.data.go.kr/data/15003297/fileData.do
#'
#' @format A data frame with 19 variables.
"globalBusiness"




#' petNames
#'
#' 서울특별시 마포구 지역경제과에서 제공하는 반려동물 이름 현황데이터. 동물이름, 동물 수 데이터를 제공.
#' Last Update: 2021-09-01;
#' https://www.data.go.kr/data/15042010/fileData.do
#'
#' @format A data frame with 2 variables.
"petNames"





#' foodBank
#' 
#' 한국사회복지협의회에서 제공하는 2021년 전국푸드뱅크 기부자 통계.
#' Last Update: 2022-03-18;
#' https://www.data.go.kr/data/15083266/fileData.do
#'
#' @format A data frame with 4 variables.
"foodBank"




#' childAbuse
#' 
#' 보건복지부 아동학대 신고정보에 대한 해당연도 말 시점의 시도별, 의심사례, 일반상담, 동일신고, 
#' 해외발생, 교직원, 의료인 등 신고현황통계.
#' Last Update: 2022-06-30;
#' https://www.data.go.kr/data/15065291/fileData.do
#'
#' @format A data frame with 4 variables.
"childAbuse"




#' carInspection
#' 
#' 한국교통안전공단에서 운영하고 있는 자동차검사소 정보. 해당 지역별 리스트와 위도, 경도 등 각종 정보를 제공.
#' Last Update: 2021-09-27;
#' https://www.data.go.kr/data/3041572/fileData.do
#'
#' @format A data frame with 22 variables.
"carInspection"




#' fireStation
#' 
#' 소방청에서 제공하는 전국 소방서 정보.
#' Last Update: 2022-04-18;
#' https://www.data.go.kr/data/15048242/fileData.do
#'
#' @format A data frame with 5 variables.
"fireStation"




#' bloodTest
#' 
#' 국민건강보험공단에서 제공하는 2014~2015년 일반검진 및 생애전환기 건강검진 혈액검사 데이터.
#' Last Update: 2021-11-24;
#' https://www.data.go.kr/data/15095107/fileData.do
#'
#' @format A data frame with 5 variables.
#' \describe{
#'   \item{SEX}{성별(남성:1, 여성:2)}
#'   \item{AGE_G}{연령(그룹)}
#'   \item{HGB}{혈색소}
#'   \item{TCHOL}{총콜레스테롤}
#'   \item{TG}{중성지방}
#'   \item{HDL}{HDL콜레스테롤}
#'   \item{ANE}{빈혈 진료여부(있음:1, 없음:0)}
#'   \item{IHD}{허혈심장질환 진료여부(있음:1, 없음:0)}
#'   \item{STK}{뇌혈관질환 진료여부(있음:1, 없음:0)}
#'  }
"bloodTest"