# 1. for문으로 다음과 같이 월 이름을 출력
# The month of January
# ...
# The month of December

for(i in 1:12)print(paste('The month of',month.name[i]))


# 2. 짝수이면 TRUE, 홀수이면 FALSE를 출력하는 함수 작성.
# 다음 벡터로 테스트하시오.
# c(-5:5)

oddEven<-function(x){
  ifelse(x%%2==0,TRUE,FALSE)
}
oddEven(c(-5:5))
# 3. 짝수 개수를 세는 함수 작성.
# 다음 벡터로 테스트하시오.
# c(-5:5)
evens<-function(x){
  sum(x%%2==0)
}

evens(-5:5)
# 4. 주어진 숫자가 원주율보다 크면 TRUE, 아니면 FALSE를 출력하는 함수 작성.
# 3과 1:5 벡터에 대해 테스트하시오
comPi<-function(x){
  ifelse(x>pi,TRUE,FALSE)
}

comPi(3)
comPi(1:5)

# 5. 주어진 그림과 같은 데이터프레임을 생성하여
# df_midterm에 저장하시오
# - 각 과목별 평균을 구하시오.
# - 각 번호별 평균을 구하시오

english=c(90,80,60,70)
math=c(50,60,100,20)
class=c(1,1,2,2)
df_midterm<-data.frame(english,math,class)
df_midterm
colMeans(df_midterm[-3])
rowMeans(df_midterm[-3])
#ㅐr
apply(df_midterm[-3],2,mean)
apply(df_midterm[-3],1,mean)
# 6. 2~99까지 수에 대해
# - 3의 배수에 해당하는 수의 합계를 구하시오.
#which(2:99%%3==0)
sum(c(2:99)[which(2:99%%3==0)])
# - 3의 배수에 해당하는 수의 개수를 구하시오.
sum(2:99%%3==0)

#or
length(which(2:99%%3==0))
# 7. 임의의 수 n을 전달받아, n!을 출력하는 함수를 완성하시오. (n>=2, 5!=5*4*3*2*1)
factorial1<-function(n){
  a=1
  for(i in 1:n) a=a*i
  print(a)
}
factorial1(4)
#or
fac<-function(x){
  if (x>=2){
    prod(n:1)
  }
}
fac(5)
#or
factorial(5)
# 
# 8. 반복문을 이용하여 구구단을 출력하시오
for(dan in 2:9) for(n in 1:9) print(paste(dan,'x',n,'=',dan*n))
#
for(i in 2:9){
  v<-c(1:9)
  res<-paste(i,"x",v,"=",i*v)
  print(res)
}
#
i<-2
while(i<10){
  v<-seq(from=1,to=9,by=1)
  res<-paste(i,"x",v,"=",i*v)
  print(res)
  i<-i+1
}
# 9. 반복문을 활용하여 출력하시오
#     *
#    ***
#   *****
#   *******
for(i in 1:4) print(paste(rep(c(' ', '*'), c(4-i, (i*2)-1)),collapse=''))
#
for(i in seq(from=1,to=7,by=2)){
  star<-paste(rep("*",times=i),collapse = "")
  blank<-paste(rep(" ",times=(7-i)/2),collapse="")
  print(paste(blank,star))
}
#   10.  타이타닉 데이터 전처리
# - train.csv 파일 읽을 때 "" 는 na로 처리하시오.
titanichw<-read.csv('train.csv',na.strings = "")
titanichw
#or
titanic <- read.table('train.csv', sep=',', header=T, na.strings=c('', ' '))
titanic
# - Surived 컬럼의 타입을 확인하시오.
str(titanichw)
class(titanichw$Survived)
mode(titanichw$Survived)
typeof(titanichw$Survived)
# - Survived 컬럼의 타입을 factor 타입으로 바꾸어 저장하시오

titanichw$Survived<-factor(titanichw$Survived)
is.factor(titanichw$Survived)
class(titanichw$Survived)
str(titanichw)
