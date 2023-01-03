#' @importFrom tibble tibble
NULL

#' 한국국제협력단 소득수준별 ODA 실적통계
#'
#' 한국국제협력단에서 제공하는 소득수준별 ODA 실적통계로 1991년부터 2019년까지의 연도별, 
#' 사업분류별, 지원액(원화), 지원액(달러)
#' https://www.data.go.kr/data/15060094/fileData.do
#'
#' @format A data frame with 4 variables.
#' \describe{
#'   \item{연도}{연도}
#'   \item{사업분류}{최빈국(LDCs), 기타저소득국(LICs), 중저소득국(LMICs), 고중소득국(UMICs), 미분류, 수원국리스트외 지역}
#'   \item{지원액_원화}{원화 기준 지원액}
#'   \item{지원액_달러}{달러 기준 지원액}
#'  }
"odaKR"




#' 도로교통공단 사망교통사고 정보
#' 
#' 도로교통공단에서 제공하는 사망 교통사고에 대한 개별정보(발생일시, 사고유형, 위치좌표 등)
#' 부상자수 = 중상자수 + 경상자수 + 부상신고자수
#' https://www.data.go.kr/data/15070340/fileData.do
#'
#' @format A data frame with 23 variables.
#' \describe{
#'   \item{발생년}{발생년}
#'   \item{발생년월일시}{발생년월일시}
#'   \item{주야}{주야}
#'   \item{요일}{요일}
#'   \item{사망자수}{사망자수}
#'   \item{부상자수}{부상자수}
#'   \item{중상자수}{중상자수}
#'   \item{경상자수}{경상자수}
#'   \item{부상신고자수}{부상신고자수}
#'   \item{발생지시도}{발생지시도}
#'   \item{발생지시군구}{발생지시군구}
#'   \item{사고유형_대분류}{차대사람, 차대차, 차량단독, 철길건널목}
#'   \item{사고유형_중분류}{차도통행중, 추돌, 횡단중, 공작물충돌, 도로이탈, 기타, 정면충돌, 측면충돌, 길가장자리구역통행중, 전도, 전복, 보도통행중, 주/정차차량 충돌, 후진중충돌, 철길건널목}
#'   \item{사고유형}{사고유형}
#'   \item{가해자법규위반}{안전운전 의무 불이행, 과속, 보행자 보호의무 위반, 중앙선 침범, 신호위반, 기타, 안전거리 미확보, 교차로 통행방법 위반}
#'   \item{도로형태_대분류}{단일로, 교차로, 기타, 불명, 철길건널목}
#'   \item{도로형태}{기타단일로, 지하차도(도로)내, 교차로횡단보도내, 교차로내, 교차로부근, 교량위, 기타, 고가도로위, 터널안, 불명, 철길건널}
#'   \item{가해자_당사자종별}{승용차, 화물차, 농기계, 승합차, 이륜차, 사륜오토바이(ATV), 특수차, 원동기장치자전거, 건설기계, 자전거, 개인형이동수단(PM), 기타}
#'   \item{피해자_당사자종별}{보행자, 화물차, 없음, 승용차, 농기계, 자전거, 이륜차, 승합차, 건설기계, 원동기장치자전거, 불명, 특수차, 사륜오토바이(ATV), 개인형이동수단(PM), 기타}
#'   \item{발생위치X_UTMK}{발생위치X_UTMK}
#'   \item{발생위치Y_UTMK}{발생위치Y_UTMK}
#'   \item{경도}{경도}
#'   \item{위도}{위도}
#'  }
#' @examples
#'  library(leaflet)
#'  accident |> 
#'    dplyr::filter(발생지시도 == "서울") |> 
#'    dplyr::filter(사망자수 > 0) |> 
#'    dplyr::filter(피해자_당사자종별 == "보행자") |> 
#'    leaflet() |> 
#'    addTiles() |> 
#'    addMarkers(~경도, ~위도, popup = ~as.character(사고유형), label = ~as.character(사고유형))
"accident"


#' 국립환경과학원 축산오염원조사정보
#'
#' 국립환경과학원에서 제공하는 축산계 오염원에 대한 조사정보
#' https://www.data.go.kr/data/3045217/fileData.do
#'
#' @format A data frame with 18 variables
#' \describe{
#'   \item{법정동코드}{법정동코드}
#'   \item{시도}{시도}
#'   \item{시군구}{시군구}
#'   \item{읍면동}{읍면동}
#'   \item{리}{리}
#'   \item{축종}{사슴, 마필(말), 산양(염소포함), 유우(젖소), 개, 한우(소), 돼지, 닭, 가금기타, 오리, 면양(육양포함), 타조}
#'   \item{법적규제}{법적규제}
#'   \item{사육두수.두.}{사육두수}
#'   \item{농가수.호.}{농가수}
#'   \item{가축분뇨발생량.m3.일.}{가축분뇨발생량/m3/일}
#'   \item{자가처리_정화방류.m3.일.}{자가처리 중 정화방류양/m3/일}
#'   \item{자가처리_퇴비화.m3.일.}{자가처리 중 퇴비화양/m3/일}
#'   \item{자가처리_액비화.m3.일.}{자가처리 중 액비화양/m3/일}
#'   \item{미처리.m3.일.}{미처리양/m3/일}
#'   \item{위탁처리_공공처리시설.m3.일.}{위탁처리 중 공공처리시설양/m3/일}
#'   \item{위탁처리_공동처리시설.m3.일.}{위탁처리 중 공동처리시설양/m3/일} 
#'   \item{위탁처리_재활용신고자.m3.일.}{위탁처리 중 재활용신고자양/m3/일}
#'   \item{위탁처리_가축분뇨처리업.m3.일.}{위탁처리 중 가축분뇨처리업양/m3/일}
#'  }
#' @examples
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
#' https://www.data.go.kr/data/3074462/fileData.do
#' 
#' @format A data frame with 90 variables.
#' \describe{
#'   \item{범죄대분류}{강력범죄, 교통범죄, 기타범죄, 노동범죄, 마약범죄, 병역범죄, 보건범죄, 선거범죄, 안보범죄, 절도범죄, 지능범죄, 특별경제범죄, 폭력범죄, 풍속범죄, 환경범죄}
#'   \item{범죄중분류}{살인기수, 살인미수등 ,강도, 강간, 유사강간, 강제추행, 기타강간강제추행등, 방화, 절도, 상해, 폭행, 체포감금, 협박, 약취유인, 폭력행위등, 공갈, 손괴, 직무유기, 직권남용, 증수뢰, 통화, 문서인장, 유가증권인지, 사기, 횡령, 배임, 성풍속범죄, 도박범죄, 특별경제범죄, 마약범죄, 보건범죄, 환경범죄, 교통범죄, 노동범죄, 안보범죄, 선거범죄, 병역범죄, 기타범죄}
#'   \item{서울}{서울}
#'   \item{부산}{부산}
#'   \item{대구}{대구}
#'   \item{인천}{인천}
#'   \item{광주}{광주}
#'   \item{대전}{대전}
#'   \item{울산}{울산}
#'   \item{세종}{세종}
#'   \item{경기.고양}{경기 고양}
#'   \item{경기.과천}{경기 과천}
#'   \item{경기.광명}{경기 광명}
#'   \item{경기.광주}{경기 광주}
#'   \item{경기.구리}{경기 구리}
#'   \item{경기.군포}{경기 군포}
#'   \item{경기.김포}{경기 김포}
#'   \item{경기.남양주}{경기 남양주}
#'   \item{경기.동두천}{경기 동두천}
#'   \item{경기.부천}{경기 부천}
#'   \item{경기.성남}{경기 성남}
#'   \item{경기.수원}{경기 수원}
#'   \item{경기.시흥}{경기 시흥}
#'   \item{경기.안산}{경기 안산}
#'   \item{경기.안성}{경기 안성}
#'   \item{경기.안양}{경기 안양}
#'   \item{경기.양주}{경기 양주}
#'   \item{경기.여주}{경기 여주}
#'   \item{경기.오산}{경기 오산}
#'   \item{경기.용인}{경기 용인}
#'   \item{경기.의왕}{경기 의왕}
#'   \item{경기.의정부}{경기 의정부}
#'   \item{경기.이천}{경기 이천}
#'   \item{경기.파주}{경기 파주}
#'   \item{경기.평택}{경기 평택}
#'   \item{경기.포천}{경기 포천}
#'   \item{경기.하남}{경기 하남}
#'   \item{경기.화성}{경기 화성}
#'   \item{강원.강릉}{강원 강릉}
#'   \item{강원.동해}{강원 동해}
#'   \item{강원.삼척}{강원 삼척}
#'   \item{강원.속초}{강원 속초}
#'   \item{강원.원주}{강원 원주}
#'   \item{강원.춘천}{강원 춘천}
#'   \item{강원.태백}{강원 태백}
#'   \item{충북.제천}{충북 제천}
#'   \item{충북.청주}{충북 청주}
#'   \item{충북.충주}{충북 충주}
#'   \item{충남.계룡}{충남 계룡}
#'   \item{충남.공주}{충남 공주}
#'   \item{충남.논산}{충남 논산}
#'   \item{충남.당진}{충남 당진} 
#'   \item{충남.보령}{충남 보령} 
#'   \item{충남.서산}{충남 서산}
#'   \item{충남.아산}{충남 아산}
#'   \item{충남.천안}{충남 천안}
#'   \item{전북.군산}{전북 군산}
#'   \item{전북.김제}{전북 김제}
#'   \item{전북.남원}{전북 남원}
#'   \item{전북.익산}{전북 익산}
#'   \item{전북.전주}{전북 전주}
#'   \item{전북.정읍}{전북 정읍}
#'   \item{전남.광양}{전남 광양}
#'   \item{전남.나주}{전남 나주}
#'   \item{전남.목포}{전남 목포}
#'   \item{전남.순천}{전남 순천}
#'   \item{전남.여수}{전남 여수}
#'   \item{경북.경산}{경북 경산}
#'   \item{경북.경주}{경북 경주}
#'   \item{경북.구미}{경북 구미}
#'   \item{경북.김천}{경북 김천}
#'   \item{경북.문경}{경북 문경}
#'   \item{경북.상주}{경북 상주}
#'   \item{경북.안동}{경북 안동}
#'   \item{경북.영주}{경북 영주}
#'   \item{경북.영천}{경북 영천}
#'   \item{경북.포항}{경북 포항}
#'   \item{경남.거제}{경남 거제}
#'   \item{경남.김해}{경남 김해}
#'   \item{경남.마산}{경남 마산}
#'   \item{경남.밀양}{경남 밀양}
#'   \item{경남.사천}{경남 사천}
#'   \item{경남.양산}{경남 양산}
#'   \item{경남.진주}{경남 진주}
#'   \item{경남.창원}{경남 창원}
#'   \item{경남.통영}{경남 통영}
#'   \item{제주.서귀포}{제주 서귀포}
#'   \item{제주.제주}{제주 제주}
#'   \item{기타도시}{기타도시}
#'   \item{도시이외}{도시이외}
#' }
#' @examples
#' crime |> 
#'   tidyr::pivot_longer(
#'     cols = 서울:도시이외, 
#'     names_to = "시군", 
#'     values_to = "건"
#'   )  
"crime"




#' 한국장학재단 2020년도 장학금 수혜현황
#'
#' 한국장학재단에서 제공하는 전년도 장학금 수혜현황(대학정보공시 항목) 조사를 통해, 대학별 재원구분에 따른 교외장학금 수혜 금액 및 
#' 성격유형에 따른 교내장학금 수혜금액 제공. 2020 회계연도부터 재난을 사유로 지급한 교내장학금 추가 조사.
#' https://www.data.go.kr/data/15038576/fileData.do
#'
#' @format A data frame with 16 variables.
#'\describe{
#'   \item{대학명}{대학명}
#'   \item{학제별}{전문대학, 대학}
#'   \item{설립별}{사립, 국공립}
#'   \item{지역별}{지역별}
#'   \item{교외장학금.소계.원.}{교외장학금 소계.원}
#'   \item{교외장학금.국가}{교외장학금 국가}
#'   \item{교외장학금.지방자치단체}{교외장학금 지방자치단체}
#'   \item{교외장학금.사설및기타}{교외장학금 사설및기타}
#'   \item{교내장학금.소계.원.}{교내장학금 소계.원}
#'   \item{교내장학금.성적우수장학금}{교내장학금 성적우수장학금}
#'   \item{교내장학금.저소득층장학금}{교내장학금 저소득층장학금}
#'   \item{교내장학금.근로장학금}{교내장학금 근로장학금}
#'   \item{교내장학금.재난장학금}{교내장학금 재난장학금}
#'   \item{교내장학금.교직원장학금"}{교내장학금 교직원장학금}
#'   \item{교내장학금.기타}{교내장학금 기타}
#'   \item{총계.원.}{총계.원}
#'   }
"scholarship"




#' 국민건강보험 일반건강검진결과
#'
#' 국민건강보험의 직장가입자와 40세 이상의 피부양자, 세대주인 지역가입자와 40세 이상의 지역가입자의 일반건강검진 결과와 이들 일반건강검진 
#' 대상자 중에 만40세와 만66세에 도달한 이들이 받게 되는 생애전환기건강진단 수검이력이 있는 각 연도별 수진자 100만 명에 대한 
#' 기본정보(성, 연령대, 시도코드 등)와 검진내역(신장, 체중, 총콜레스테롤, 혈색소 등)으로 구성된 개방데이터
#' https://www.data.go.kr/data/15007122/fileData.do
#'
#' @format A data frame with 31 variables.
#'\describe{
#'  \item{기준년도}{기준년도}
#'  \item{가입자.일련번호}{가입자.일련번호}
#'  \item{시도코드}{시도코드}
#'  \item{성별코드}{성별코드}
#'  \item{연령대.코드.5세단위.}{연령대 코드_5세단위}
#'  \item{신장.5Cm단위.}{신장_5Cm 단위}
#'  \item{체중.5Kg.단위.}{체중_5Kg 단위.}
#'  \item{허리둘레}{허리둘레}
#'  \item{시력.좌.}{시력_좌}
#'  \item{시력.우.}{시력_우}
#'  \item{청력.좌.}{청력_좌}
#'  \item{청력.우.}{청력_우}
#'  \item{수축기.혈압}{수축기 혈압}
#'  \item{이완기.혈압}{이완기 혈압}
#'  \item{식전혈당.공복혈당.}{식전혈당 공복혈당}
#'  \item{총.콜레스테롤}{총 콜레스테롤}
#'  \item{트리글리세라이드}{트리글리세라이드}
#'  \item{HDL.콜레스테롤}{HDL 콜레스테롤}
#'  \item{LDL.콜레스테롤}{LDL 콜레스테롤}
#'  \item{혈색소}{혈색소}
#'  \item{요단백}{요단백}
#'  \item{혈청크레아티닌}{혈청크레아티닌}
#'  \item{X.혈청지오티.AST}{X.혈청지오티.AST}
#'  \item{X.혈청지오티.ALT}{X.혈청지오티.ALT}
#'  \item{감마.지티피}{감마.지티피}
#'  \item{흡연상태}{흡연상태}
#'  \item{음주여부}{음주여부}
#'  \item{구강검진.수검여부}{구강검진 수검여부}
#'  \item{치아우식증유무}{치아우식증유무}
#'  \item{치석}{치석}
#'  \item{데이터.공개일자}{데이터 공개일자}
"medicalCheckup"




#' 산업통상자원부 전국 주유소 등록현황
#'
#' 산업통상자원부에서 제공하는 전국 주유소 등록현황(전국 주유소 신규 등록 , 휴업, 폐업 현황 정보, 연도, 변동사유발생연월일, 판매업종류 등). 
#' Last Update: 2022-03-10;
#' https://www.data.go.kr/data/3076606/fileData.do
#'
#' @format A data frame with 6 variables.
#' \describe{
#'    \item{연도}{연도}
#'    \item{변동사유발생연월일}{변동사유발생연월일}
#'    \item{판매업종류 }{휴업, 신규등록, 폐업, 등록취소}
#'    \item{구분}{구분}
#'    \item{업체명}{업체명}
#'    \item{소재지}{소재지}
#' }
"gasStation"




#' 국토교통부 2021 공동주택 공시가격 정보
#'
#' 국토교통부에서 제공하는 2021년도 공동주택 공시가격정보입니다. 
#' Last Update: 2021-10-29;
#' https://www.data.go.kr/data/3073746/fileData.do
#'
#' @format A data frame with 20 variables.
#'\describe{
#'    \item{기준연도}{기준연도}
#'    \item{기준월}{기준월}
#'    \item{법정동코드}{법정동코드}
#'    \item{도로명주소}{도로명주소}
#'    \item{시도}{시도}
#'    \item{시군구}{시군구}
#'    \item{읍면}{읍면}
#'    \item{동리}{동리}
#'    \item{특수지코드}{특수지코드}
#'    \item{본번}{본번}
#'    \item{부번}{부번}
#'    \item{특수지명}{특수지명}
#'    \item{단지명}{단지명}
#'    \item{동명}{동명}
#'    \item{호명}{호명}
#'    \item{전용면적}{전용면적}
#'    \item{공시가격}{공시가격}
#'    \item{단지코드}{단지코드}
#'    \item{동코드}{동코드}
#'    \item{호코드}{호코드}
#'}
"housingPrice"




#' 경기도 맛집 정보
#'
#' 경기도 지역 특산물을 활용한 향토 특색음식점으로 경기도를 대표할 수 있는 맛, 위생, 서비스가 우수한 업소를 발굴하여 
#' 경기으뜸맛집으로 육성하고자 선정된 맛집 현황입니다. 음식점명, 맛집전화번호, 대표음식명, 주소, 위경도 등의 정보를 제공합니다.
#' Last Update: 2017-11-20;
#' https://www.data.go.kr/data/15057234/openapi.do
#'
#' @format A data frame with 9 variables.
#' \describe{
#'    \item{시군명}{시군명}
#'    \item{음식점명}{음식점명}
#'    \item{맛집전화번호 }{맛집전화번호}
#'    \item{대표음식명 }{대표음식명}
#'    \item{소재지우편번호}{소재지우편번호}
#'    \item{소재지도로명주소}{소재지도로명주소}
#'    \item{소재지지번주소}{소재지지번주소}
#'    \item{WGS84위도}{WGS84위도}
#'    \item{WGS84경도}{WGS84경도}
#' }
"restaurant"




#' 국민연금공단 국민연금사업장 정보
#'
#' 국민연금공단에서 제공하는 법정동단위 지역별, 국민연금 가입 사업장 정보(단, 개인사업장 및 2인 이하 법인 사업장 정보 미제공).
#' Last Update: 2022-05-18;
#' https://www.data.go.kr/data/15083277/fileData.do
#'
#'@format A data frame with 22 variables.
#'\describe{
#'    \item{자료생성년월}{자료생성년월}
#'    \item{사업장명}{사업장명}
#'    \item{사업자등록번호}{사업자등록번호}
#'    \item{사업장가입상태코드.1.등록.2.탈퇴}{사업장가입상태코드.1.등록.2.탈퇴}
#'    \item{우편번호}{우편번호}
#'    \item{사업장지번상세주소}{사업장지번상세주소}
#'    \item{사업장도로명상세주소}{사업장도로명상세주소}
#'    \item{고객법정동주소코드}{고객법정동주소코드}
#'    \item{고객행정동주소코드}{고객행정동주소코드}
#'    \item{법정동주소광역시도코드}{법정동주소광역시도코드}
#'    \item{법정동주소광역시시군구코드}{법정동주소광역시시군구코드}
#'    \item{법정동주소광역시시군구읍면동코드}{법정동주소광역시시군구읍면동코드}
#'    \item{사업장형태구분코드.1.법인.2.개인}{사업장형태구분코드.1.법인.2.개인}
#'    \item{사업장업종코드}{사업장업종코드}
#'    \item{사업장업종코드명}{사업장업종코드명}
#'    \item{적용일자}{적용일자}
#'    \item{재등록일자}{재등록일자}
#'    \item{탈퇴일자}{탈퇴일자}
#'    \item{가입자수}{가입자수}
#'    \item{당월고지금액}{당월고지금액}
#'    \item{신규취득자수}{신규취득자수}
#'    \item{상실가입자수}{상실가입자수}
#'}
"nationalPension"




#' 서울특별시 우체국 정보
#'
#' 서울특별시 우체국 정보에 대한 데이터로 전체기관명, 대표 전화번호, 새우편번호, 도로명주소, 행정시, 행정구, 행정동 정보.
#' Last Update: 2021-05-27;
#' https://www.data.go.kr/data/15047367/fileData.do
#' 
#' @format A data frame with 14 variables.
#'\describe{
#'    \item{키값}{키값}
#'    \item{기관코드}{기관코드}
#'    \item{유형1}{우정}
#'    \item{유형2}{우정_우체국}
#'    \item{대표기관명}{미래부}
#'    \item{전체기관명}{전체기관명}
#'    \item{최하위기관명}{최하위기관명}
#'    \item{대표전화번호}{대표전화번호}
#'    \item{새우편번호}{새우편번호}
#'    \item{주소}{주소}
#'    \item{도로명주소}{도로명주소}
#'    \item{행정시}{행정시}
#'    \item{행정구}{행정구}
#'    \item{행정동}{행정동}
#'}
"postOffice"




#' 건강보험심사평가원 의약품 주성분 정보
#'
#' 건강보험심사평가원에서 제공하는 의약품 주성분(일반명) 현황에 대한 데이터셋. 
#' 의약품주성분 코드, 성분명, 제형구분, 투여, 함량, 단위 등 정보를 제공.
#' Last Update: 2021-10-25;
#' https://www.data.go.kr/data/15067461/fileData.do
#'
#' @format A data frame with 8 variables.
#' \describe{
#'    \item{일반명코드}{일반명코드}
#'    \item{제형구분코드}{제형구분코드}
#'    \item{제형}{과립제,세립, 액제, 산제, 경질캡슐제, 주사제, 정제,저작정, 장용정제 등}
#'    \item{일반명}{일반명}
#'    \item{분류번호}{분류번호}
#'    \item{투여}{내복, 주사, 외용}
#'    \item{함량}{함량}
#'    \item{단위}{단위} 
#' }
"medicine"




#' 한국소비자원 생필품가격 정보
#'
#' 한국소비자원 참가격정보서비스에 접수된 상품별 생필품 가격 데이터 현황(상품명, 판매업소, 판매가격 등).
#' Last Update: 2022-05-23;
#' https://www.data.go.kr/data/15083256/fileData.do
#'
#' @format A data frame with 7 variables.
#' \describe{
#'    \item{상품명}{상품명}
#'    \item{조사일}{조사일}
#'    \item{판매가격}{판매가격}
#'    \item{판매업소}{판매업소}
#'    \item{제조사}{제조사}
#'    \item{세일여부}{Y, N}
#'    \item{원플러스원}{N, }
#' }
"necessariesPrice"




#' 대한무역투자진흥공사 해외진출기업 정보
#'
#' 대한무역투자진흥공사에서 제공하는 전세계 124개국의 해외진출기업의 회사명, 주소, 홈페이지, 진출년도, 진출형태, 투자형태 등의 정보.
#' Last Update: 2021-09-27;
#' https://www.data.go.kr/data/15003297/fileData.do
#'
#' @format A data frame with 19 variables.
#' \describe{
#'    \item{구분}{구분}
#'    \item{국가명}{국가명}
#'    \item{진출지역}{진출지역}
#'    \item{회사명.국문.}{회사명_국문}
#'    \item{회사명.영문.}{회사명_영문}
#'    \item{주소}{주소}
#'    \item{홈페이지}{홈페이지}
#'    \item{진출년도}{진출년도}
#'    \item{진출형태}{진출형태}
#'    \item{투자형태}{M&A, 단독, 합자, 합작}
#'    \item{외국사.합작지분}{외국사 합작지분}
#'    \item{업종1}{제조업, 금융·보험업, 도매 및 소매업, 운수업, 농업·임업 및 어업, 건설·공사업, 서비스업, 광업·자원개발, 부동산 및 임대업, 기타, 제조업}
#'    \item{업종2}{목재·가구·펄프·종이, -, 식료품, 출판·영상·방송통신 및 정보, 사업 시설관리 및 사업지원, 예술·스포츠 및 여가 관련, 기타 서비스업 등}
#'    \item{취급분야}{취급분야}
#'    \item{본사파견}{본사파견}
#'    \item{현지채용}{현지채용}
#'    \item{내수.수출}{수출 및 내수 병행, 100% 주재국 내수시장 공급, 100% 제3국 수출}
#'    \item{모기업명}{모기업명}
#'    \item{관할무역관}{오클랜드무역관, 비엔티안무역관, 쿠알라룸푸르무역관, 양곤무역관, 호치민무역관, 하노이무역관}
#' }
"globalBusiness"




#' 마포구 반려동물 이름 통계
#'
#' 서울특별시 마포구 지역경제과에서 제공하는 반려동물 이름 현황데이터. 동물이름, 동물 수 데이터를 제공.
#' Last Update: 2021-09-01;
#' https://www.data.go.kr/data/15042010/fileData.do
#'
#' @format A data frame with 2 variables.
#' \describe{
#'    \item{동물이름}{동물이름}
#'    \item{건수}{건수}
#' }
"petNames"





#' 한국사회복지협의회 2021 전국푸드뱅크 기부자 통계
#' 
#' 한국사회복지협의회에서 제공하는 2021년 전국푸드뱅크 기부자 통계.
#' Last Update: 2022-03-18;
#' https://www.data.go.kr/data/15083266/fileData.do
#'
#' @format A data frame with 4 variables.
#' \describe{
#'    \item{지역}{지역}
#'    \item{지원센터명}{지원센터명}
#'    \item{기부자명}{기부자명}
#'    \item{합계}{합계}
#'}
"foodBank"




#' 보건복지부 아동학대 신고정보
#' 
#' 보건복지부 아동학대 신고정보에 대한 해당연도 말 시점의 시도별, 의심사례, 일반상담, 동일신고, 
#' 해외발생, 교직원, 의료인 등 신고현황통계.
#' Last Update: 2022-06-30;
#' https://www.data.go.kr/data/15065291/fileData.do
#'
#' @format A data frame with 4 variables.
#' \describe{
#'.   \item{기간}{기간}
#'    \item{구분}{구분}
#'    \item{신고자}{신고자}
#'    \item{신고건수}{신고건수}
#' }
"childAbuse"




#' 한국교통안전공단 자동차검사소 정보
#' 
#' 한국교통안전공단에서 운영하고 있는 자동차검사소 정보. 해당 지역별 리스트와 위도, 경도 등 각종 정보를 제공.
#' Last Update: 2021-09-27;
#' https://www.data.go.kr/data/3041572/fileData.do
#'
#' @format A data frame with 22 variables.
#' \describe{
#'    \item{자동차검사소명}{자동차검사소명}
#'    \item{자동차검사소유형}{자동차검사소유형}
#'    \item{소재지도로명주소}{소재지도로명주소}
#'    \item{소재지지번주소}{소재지지번주소}
#'    \item{위도}{위도}
#'    \item{경도}{경도}
#'    \item{검사소전화번호}{검사소전화번호}
#'    \item{운영시간}{운영시간}
#'    \item{검사진로수}{검사진로수}
#'    \item{부지면적}{부지면적}
#'    \item{건물면적}{건물면적}
#'    \item{검사기술인력수}{검사기술인력수}
#'    \item{신규검사여부}{Y, N}
#'    \item{정기검사여부}{Y, N}
#'    \item{튜닝검사여부}{Y, N}
#'    \item{임시검사여부}{Y, N}
#'    \item{수리검사여부}{Y, N}
#'    \item{배출가스정밀검사여부}{Y, N}
#'    \item{택시미터검정여부}{Y, N}
#'    \item{관리기관전화번호}{관리기관전화번호}
#'    \item{관리기관명}{관리기관명}
#'    \item{데이터기준일자}{데이터기준일자}
#' }
"carInspection"




#' 소방청 전국 소방서 정보
#' 
#' 소방청에서 제공하는 전국 소방서 정보.
#' Last Update: 2022-04-18;
#' https://www.data.go.kr/data/15048242/fileData.do
#'
#' @format A data frame with 5 variables.
"fireStation"




#' 국민건강보험공단 2014-15 혈액검사 데이터
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




#' 한국국제협력단 국가별 개발협력동향정보
#' 
#' 한국국제협력단에서 제공하는 국가별 개발 협력 동향정보 데이터. 지역, 국가, 관할사무소, 구분(공여국/수원국/국제기구/KOICA), 
#' KOICA 12대분야 및 기타, 동향기사 제목 및 본문내용, 출처, 링크 정보를 제공. 
#' Last Update: 2022-06-29;
#' https://www.data.go.kr/data/15052910/fileData.do
#'
#' @format A data frame with 16 variables.
"odaNews"



#' 국토교통부 법정동 정보
#' 
#' 국토교통부에서 제공하는 법정동 정보. 우리나라의 법정 구역으로 법률로 지정된 일정한 명칭과 영역을 지닌 구역으로 
#' 토지행정시스템에서 사용하는 법정동 데이터. 현존하는 법정동코드는 삭제일자가 없으며, 과거법정동코드는
#' 행정표준코드관리시스템(https://www.code.go.kr)에서 제공하는 법정동코드 자료를 바탕으로 시스템 사용 용도에 
#' 맞춰 가공한 데이터로 정보가 상이할 수 있음.
#' Last Update: 2021-12-17;
#' https://www.data.go.kr/data/15063424/fileData.do
#'
#' @format A data frame with 9 variables.
"legalDong"




#' 건강보험심사평가원 병의원 기본정보
#' 
#' 건강보험심사평가원에서 제공하는 병의원 기본정보 데이터셋.
#' Last Update: 2022-04-14;
#' https://www.data.go.kr/data/15051059/fileData.do
#'
#' @format A data frame with 29 variables.
"hospitalInfo"




#' 건강보험심사평가원 약국 기본정보
#' 
#' 건강보험심사평가원에서 제공하는 약국 기본정보 데이터셋.
#' Last Update: 2022-04-14;
#' https://www.data.go.kr/data/15051059/fileData.do
#'
#' @format A data frame with 15 variables.
"pharmacyInfo"




#' 한국장학재단 장학금 정보
#' 
#' 한국장학재단에서 제공하는 매년 4월 대학정보공시 기준의 대학별 입학정원, 평균입학금, 평균등록금 정보(분교, 캠퍼스는 본교에 통합 산출).
#' Last Update: 2022-05-25;
#' https://www.data.go.kr/data/3071171/fileData.do
#'
#' @format A data frame with 7 variables.
"tuition"




#' 농림축산식품부 농업 종관기상 데이터
#' 
#' 농림축산식품부에서 제공하는 농업 종관기상 데이터.
#' Last Update: 2021-03-26;
#' https://www.data.go.kr/data/15034381/fileData.do
#'
#' @format A list with 3 data frame.
"weather2020"




#' 국토교통부 전세계 공항정보
#' 
#' 국토교통부에서 제공하는 전세계 공항의 영문 공항명, 한글 공항명, IATA 코드, ICAO 코드, 국가명, 지역명에 대한 정보.
#' Last Update: 2022-06-10;
#' https://www.data.go.kr/data/3051587/fileData.do
#'
#' @format A list with 8 data frame.
"airport"




#' 한국국제협력단 협력국 개발지표 및 ODA 지원 실적
#' 
#' 한국국제협력단(KOICA)에서 제공하는 협력국(총 138개국/ 사무소 주재국 44개, 겸임국 94개)의 개발 지표 및 ODA 지원 실적. 
#' *개발지표: 인구, 경제, 인간개발, 빈곤, 교육, 재정, 거버넌스, 비즈니스, 산업인프라, 성평등
#' *출처: World Bank Open data, Human Development Data Center, Fragile States Index, Transparency International, 
#' UN Department of Economic and Social Affairs Public Institutions, OECD Statistics, KOICA ODA 정보센터
#' Last Update: 2022-05-13;
#' https://www.data.go.kr/data/15088160/fileData.do
#'
#' @format A list with 80 data frame.
"odaIndex"





#' 행정안전부 단란주점 영업 정보
#' 
#' 행정안전부에서 제공하는 단란주점 영업 정보. 주로 주류와 함께 음식류를 조리 및 판매하는 곳으로 손님이 노래를 부르는 행위가 허용되는 업소정보 데이터로 인허가일자, 영업상태, 사업장명, 소재지주소 등의 정보등을 제공. * 좌표계 : 중부원점TM(EPSG:2097).
#' Last Update: 2021-11-19;
#' https://www.data.go.kr/data/15045017/fileData.do
#'
#' @format A list with 48 data frame.
"karaoke"





#' 소방청 화재통계
#' 
#' 소방청에서 제공하는 장소별 원인별 화재통계.
#' Last Update: 2020-03-19;
#' https://www.data.go.kr/data/3038724/fileData.do
#'
#' @format A list with 18 data frame.
"fire" 






#' 식품의약품안전처 식품영양성분 데이터베이스
#' 
#' 식품의약품안전처에서 제공하는 농축수산물, 가공식품 및 음식 영양성분 데이터베이스. 이용허락범위: 저작자표시(CC BY). 
#' 본 저작물은 '식품의약품안전처'에서 '2020년'작성하여 공공누리 제1유형으로 개방한 '식품영양성분 데이터베이스를'을 이용하였으며, 
#' 해당 저작물은 '식품의약품안전처 식품영양성분 데이터베이스(https://www.foodsafetykorea.go.kr/fcdb/index.do)'에서 무료로 다운받으실 수 있습니다.
#' Last Update: 2020-10-28;
#' https://www.data.go.kr/data/15047698/fileData.do
#'
#' @format A list with 146 data frame.
"foodNutrients" 





#' 공공데이터활용지원센터 공공데이터포털 목록개방현황
#' 
#' 공공기관이 등록하여 공공데이터포털에서 개방중인 목록 정보(목록명, 목록타입(파일, API), 표준데이터 여부, 국가중점여부, 등록기관, 
#' 기관 분류, 분류체계, 등록일, 마지막 수정일) 를 제공. 이용허락범위 제한 없음.
#' Last Update: 2022-07-01;
#' https://www.data.go.kr/data/15062804/fileData.do
#'
#' @format A list with 13 data frame.
"openData" 





#' 한국승강기안전공단 국내 승강기 보유 현황
#' 
#' 한국승강기안전공단에서 제공하는 국내 승강기 보유 현황. 이용허락범위 제한 없음.
#' Last Update: 2022-02-22;
#' https://www.data.go.kr/data/15017366/fileData.do
#'
#' @format A list with 8 data frame.
"elevator" 




#' 경찰청 범죄 발생 장소별 통계
#' 
#' 경찰청에서 제공하는 범죄유형별(강력범죄, 폭력범죄, 지능범죄 등)로 범죄장소(아파트, 단독주택, 고속도로, 노상 ,백화점, 슈퍼마켓 등)별 통계. 이용허락범위 제한 없음.
#' Last Update: 2022-10-08;
#' https://www.data.go.kr/data/3074463/fileData.do
#'
#' @format A list with 4 data frame.
"crimePlace" 







#' 국토교통부 전국 버스 정류장 위치정보
#' 
#' 버스정보시스템(BIS)이 구축된 지자체 중 국가대중교통정보센터(TAGO)와 연계된 136개 지자체에 대한 버스정류장 위치정보 데이터. 안동-예천의 경우 안동, 원주-횡성은 원주, 제주-서귀포는 제주, 대전-계룡은 대전, 목포-무안-신안-영암은 목포, 영덕-청송-영양은 영덕으로 통합. 이용허락범위 제한 없음.
#' Last Update: 2021-09-16;
#' https://www.data.go.kr/data/15067528/fileData.do
#'
#' @format A data frame with 11 variables.
#' \describe{
#'   \item{정류장아이디}{정류장 아이디}
#'   \item{정류장.명칭}{정류장 명칭}
#'   \item{정류장.유형}{정류장 유형(0:공용, 1:일반시내, 2:좌석시내, 3:직행좌석형시내, 4:일반형시외, 5:좌석형시외, 6:고속형시외, 7:마을버스)}
#'   \item{중앙차로.여부}{중앙차로 여부(Y/N)}
#'   \item{노드영문명}{노드영문명}
#'   \item{위도}{GPS 위도(WGS84)}
#'   \item{경도}{GPS 경도(WGS84)}
#'   \item{수집일시}{정보 수집일시}
#'   \item{단축아이디}{모바일(ARS) 단축 아이디}
#'   \item{도시코드}{도시코드}
#'   \item{도시명}{도시명}
#'  }
#'  
#' @examples
#' library(leaflet)
#' 
#' busStation |> 
#'   dplyr::filter(도시명 == "울릉군") |> 
#'   leaflet() |> 
#'   addTiles() |> 
#'   addMarkers(~경도, ~위도, popup = ~as.character(정류장.명칭), label = ~as.character(정류장.명칭))
"busStation"




#' 서울특별시 응급실 위치 정보
#' 
#' 서울특별시에서 제공하는 서울시 응급실 위치 정보. 주소, 병원분류명, 응급의료기관, 응급실운영여부, 비고, 기관설명상세, 간이약도, 기관명, 대표전화, 응급실 전화, 진료시간, 병원경도, 병원위도 등의 항목으로 구성. 본 저작물은 서울특별시에서 2021년 작성하여 공공누리 제1유형으로 개방한 '서울특별시 응급실 위치 정보(작성자:서울특별시 빅데이터담당관)'을 이용하였으며, 저작물은 '서울시 열린 데이터 광장(http://data.seoul.go.kr/dataList/OA-20338/S/1/datasetView.do)'에서 무료로 다운받으실 수 있습니다.
#' Last Update: 2021-09-16;
#' https://www.data.go.kr/data/15088910/fileData.do
#'
#' @format A data frame with 34 variables.
#'  
#' @examples
#' library(leaflet)
#' 
#' seoulER |> 
#' leaflet() |> 
#'   addTiles() |> 
#'   addMarkers(~병원경도, ~병원위도, popup = ~as.character(기관명), label = ~as.character(기관명))
"seoulER"






#' 경기도 응급의료기관 및 응급의료지원센터 현황
#' 
#' 경기도 내 응급의료기관 및 응급의료지원센터 현황. 기관 및 센터의 소재지 주소와 대표 전화번호 등의 정보를 제공. 이용허락범위 제한 없음.
#' Last Update: 2022-05-02;
#' https://www.data.go.kr/data/15011313/fileData.do
#'
#' @format A data frame with 14 variables.
#'  
#' @examples
#' library(leaflet)
#' 
#' gyeonggiER |> 
#' leaflet() |> 
#'   addTiles() |> 
#'   addMarkers(~경도, ~위도, popup = ~as.character(`병원명/센터명`), label = ~as.character(`병원명/센터명`)) |> 
#'   addMarkers(~병원경도, ~병원위도, popup = ~as.character(기관명), label = ~as.character(기관명), data = datatoys::seoulER)
"gyeonggiER"