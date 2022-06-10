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