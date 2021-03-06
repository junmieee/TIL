install.packages('ggplot2')
#mpg dataset
library(ggplot2)
mpg #tibble 구조
str(mpg)
mpg$displ

midwest<-as.data.frame(midwest)

install.packages('dplyr')
library(dplyr)
#rename(데이터프레임, 변경후컬럼이름=변경전컬럼이름)
midwest
rename(midwest,cg=category)
names(midwest)
head(midwest)

# 1. 시험 점수 변수 만들고 출력하기
# 다섯 명의 학생이 시험을 봤습니다. 학생 다섯 명의 시험 점수를 담고 있는 변수를 만들어 출력해 보세요. 각
# 학생의 시험 점수는 다음과 같습니다.
score<-c(80, 60, 70, 50, 90)
score
# 2. 전체 평균 구하기
# 앞 문제에서 만든 변수를 이용해서 이 학생들의 전체 평균 점수를 구해보세요.
mean(score)

# 3. 전체 평균 변수 만들고 출력하기
# 전체 평균 점수를 담고 있는 새 변수를 만들어 출력해 보세요. 앞 문제를 풀 때 사용한 코드를 응용하면
# 됩니다.
avg<-mean(score)
avg
# 4. data.frame()과 c()를 조합해서 표의 내용을 데이터 프레임으로 만들어 출력해보세요.
# 제품 가격 판매량
# 사과 1800 24
# 딸기 1500 38
# 수박 3000 13
new.cols<-data.frame(menu=c('aa','bb','aa','cc','aa','bb'),
                     quantity=c(10,20,30,20,10,25)
)

df<-data.frame(제품=c('사과','딸기','수박'),
             가격=c(1800,1500,3000),
             판매량=c(24,38,13)
             )
# 5. 앞에서 만든 데이터 프레임을 이용해서 과일 가격 평균, 판매량 평균을 구해보세요
mean(df$가격)
mean(df$판매량)
#or
apply(df[,-1],2,FUN=mean)
# 6. mpg 데이터의 변수명은 긴 단어를 짧게 줄인 축약어로 되어있습니다.
install.packages("ggplot2")
library(ggplot2)
mpg

mpg$displ

midwest<-as.data.frame(midwest)  #tibble->dataframe
install.packages("dplyr")
library(dplyr)

#rename(데이터프레임, 변경후컬럼이름=변경전 컬럼 이름)
midwest

rename(midwest, cg=category)
# cty 변수는 도시 연비, hwy 변수는고속도로 연비를 의미합니다. 
# 변수명을 이해하기 쉬운 단어로 바꾸려고 합니다. 
# mpg 데이터를 이용해서 아래 문제를 해결해 보세요.
# • Q1. ggplot2 패키지의 mpg 데이터를 사용할 수 있도록 불러온 뒤 복사본을 만드세요.
library(ggplot2)
head(mpg)
mpg_dup=mpg
mpg_dup<-data.frame(mpg)
mpg_dup
# • Q2. 복사본 데이터를 이용해서 cty는 city로, hwy는 highway로 변수명을 수정하세요.
names(mpg_dup)
library(dplyr)
mpg_dup<-rename(mpg_dup,city=cty)
mpg_dup<-rename(mpg_dup,highway=hwy)
names(mpg_dup)
# • Q3 자동차 배기량에 따라 고속도로 연비가 다른지 알아보자
# - displ(배기량)이 4 이하인 자동차와 5 이상인 자동차 중 어떤 자동차의 hwy(연비)가 평균적으로 높은가?
under4hwy<-mean(mpg_dup[mpg_dup$displ<=4,"highway"])
under5hwy<-mean(mpg_dup[mpg_dup$displ>=5,"highway"])

max(under4hwy,under5hwy)
#   • Q5. 자동차 제조 회사에 따라 도시 연비가 다른지 알아보자. 
# -"audi"와 "toyota" 중 어느 manufacturer의 cty가 평균적으로 높은지 알아 보자.
str(mpg_dup)
mpg_dup$manufacturer<-as.factor(mpg_dup$manufacturer)

audicty<-mean(mpg_dup$city[mpg_dup$manufacturer=='audi'])
toyotacty<-mean(mpg_dup$city[mpg_dup$manufacturer=='toyota'])

c(audicty,toyotacty)
# • Q6. 자동차 종류에 따라 도시 연비가 다른지 알아보자. 
# - class가 "suv"인 자동차와 "compact"인 자동차 중 어떤 자동차의 cty가 더 높은지 알아보자.
str(mpg_dup)

mpgclass<-unique(mpg_dup$class)
mpgclass
compactcty<-mean(mpg_dup$city[mpg_dup$class=='compact'])
suvcty<-mean(mpg_dup$city[mpg_dup$class=='suv'])
c(compactcty,suvcty)
# 7. ggplot2 패키지에는 미국 동북중부 437개 지역의 인구통계 정보를 담은 midwest라는 
# 데이터가 포함되어있습니다. midwest 데이터를 사용해 데이터 분석 문제를 해결해보세요.
# • 문제 1. ggplot2 의 midwest 데이터를 데이터 프레임 형태로 불러와서 데이터의 특성을 파악하세요.
midwest<-as.data.frame(midwest)
head(midwest)
str(midwest)
# • 문제 2. poptotal(전체 인구)을 total 로, popasian(아시아 인구)을 asian 으로 변수명을 수정하세요.
midwest<-rename(midwest,total=poptotal)
midwest<-rename(midwest,asian=popasian)
head(midwest)
# • 문제 3. 아시아 인구 백분율 전체 평균을 구하고, 평균을 초과하면 "large", 그 외에는 "small"을 부여하는
# 파생변수를 만들어 보세요
prop<-midwest$asian/midwest$total
meanprop<-mean(prop)

prop>meanprop

midwest$size<-c('large')
midwest$size[prop<=meanprop]<-'small'
midwest
# 
# 8. 햄릿 데이터 파일을 읽은 후 다음 작업을 진행하시오.
haml<-readLines('Hamlet.txt')
haml

# • 문제 1. ******로 시작하고 ******로 끝나는 문자열 추출
grep('^[*]{6}.+[*]{6}$',haml,value=T)
# • 문제 2. 대문자로 시작되는 단어들만 추출 -> 단어별 빈도수 출력
class(haml)
haml1<-unlist(strsplit(haml,' '))


uppers<-grep('[^[:alpha:]]',haml1,value=T)
upeers<-gsub('[^[:alpha:]]',replacement='',uppers)
table(uppers)

#다른 풀이
# 단어 추출하기
words <- strsplit(hamlet, split=' ') # 공백 단위로 자르기
words <- grep('[A-Za-z]+', unlist(words), value=T) # 벡터화 한 words에서 알파벳이 하나 이상인 것 뽑기
words <- gsub('[[:punct:][:digit:]]','',words) # 문장부호, 숫자 없애기
capital <- grep('^[A-Z]', words, value=T)
table(capital)

# • 문제 3. 대괄호([ 또는 ])로 묶여있는 문자열 출력
haml
charr<-grep("[[].*[]]",haml,value=T)
gsub('.*[[]|[]].*',replacement='',charr)

# • 문제 4. 모든 단어를 소문자로 변환 -> 가장 빈도수가 높은 단어 50개 출력
lowers<-tolower(haml1)
lowers
lowers<-gsub('[^[:alpha:]]',replacement = '',lowers)
lowers
lowers<-lowers[lowers!=""]

sort(c(table(lowers)),decreasing = T)[1:50]
#or
tabsor<-table(lowers)
df<-as.data.frame(tabsor)
df
head(df[order(df$Freq,decreasing=T),],50)

#다른풀이
words.lower<-tolower(words)
words.lower.df<-data.frame(table(factor(words.lower)))
words.lower.df
head(words.lower.df[order(words.lower.df$Freq,decreasing = T),],50)
# • 문제 5. Ham. ->Hamlet. 으로 치환
repla<-gsub('Ham[.]',replacement = 'Hamlet.',haml1)
grep('Ham[.]',repla,value=T)
grep('Hamlet[.]',repla,value=T)

# • 문제 6. Scene 으로 시작되는 문자열 출력
grep('^(Scene)',haml,value=T)

# 9. 2021년 2월 27일부터 7일간 월, 일, 요일을 출력
# "토-0227" "일-0228" ...
today<-Sys.Date()
date7<-seq(today+1,by=1,length.out=7)


weeks<-weekdays(date7)
Months<-months(date7)
days<-format(date7,format='%d일')
data.frame(date7,weeks,Months,days)
#or
today <- Sys.Date()
format(today+1:7, format='%a-%m%d')

d <- as.Date('2021-02-27')
format(d+0:6, format='%a-%m%d')
