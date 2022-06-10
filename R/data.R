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