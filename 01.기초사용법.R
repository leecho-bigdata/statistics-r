# 01.기초사용법
# https://r4ds.had.co.nz/tibbles.html

#######################################################
# tidyverse: tidy형식 기본도구                        #
#            ggplot2, purrr, tibble  3.0.3,           #
#            dplyr, tidyr, stringr, readr, forcats    #
#            등 8개 패키지를 한 곳에 묶은 형태        #
#                                                     #
# tidymodels:tidy 모델 분석도구(데이터마이닝, 통계)   #
#            broom, recipes, dials, rsample, infer,   #
#            tune, modeldata, workflows, parsnip,     #
#            yardstick                                #
#                                                     #
# rstatix: pipe-friendly framework with tidyverse     #
#          stats, utils, tidyr, purrr, broom , rlang  #
#          tibble, dplyr, magrittr, corrplot,         # 
#          tidyselect, car, generics                  #
#######################################################




# 1.기본 package 설정

# 1.1 package 설치
# install.packages("tidyverse")
# install.packages("tidymodels")
# install.packages("rstatix")

# 1.2 library 로드
library(tidyverse)
library(tidymodels) 
library(rstatix) 

# 실행방법 run, Ctrl+enter





# 2.데이터구조
# ppt 데이터구조 설명


# 2.1 스칼라
c(1) # 소문자
C(1) # 대문자 에러

# 2.2 벡터(숫자형)
num <- c(1:100)
num

# 2.3 문자형, 논리형
char <- c("남자","여자")
char

# 2.4 행렬 (Matrix 4x3) 
matrix(num, nrow=4)

# 2.5 데이터프레임
matrix(num, char)

df <- data.frame(num,char)
df

# 2.6 tibble
as_tibble(df)





# 3.외부 데이터 불러오기
# 3.1 숫자일 경우에는 숫자 -> factor로 처리
# ppt 결과삭제 설명

ist_tb <- read_csv('01_1.ist_num.csv', 
                    col_names = TRUE,
                    na=".") # csv 데이터 읽어오기
str(ist_tb)
ist_tb

# 3.2 행과 열 변수 호출
ist_tb$t_group        # 데이터명$변수명
ist_tb[1:10,1:2]  # [행번호, 열번호]    # [행번호, 열번호]


# 3.3.pipe operator 
# ppt pipe 설명하기
# %>% 사용하지 않음
ist_table <- table(ist_tb$t_group)
ist_table

barplot(ist_table)

# %>% 사용
ist_tb$t_group %>%
  table() %>%
  barplot()


# factor 처리
ist_tb <- ist_tb %>%
  mutate(t_group = factor(t_group, 
                          levels = c(1,2),
                          labels = c("A자동차",
                                     "B자동차")))
str(ist_tb)
ist_tb

ist_tb$t_group %>%
  table() %>%
  barplot()







# 4.한글 인코딩 처리
ist_tb <- read_csv('01_2.ist_chr.csv', 
                   col_names = TRUE,
                   na=".") # csv 데이터 읽어오기
ist_tb

ist_tb <- read_csv('01_2.ist_chr.csv',
                   col_names = TRUE,
                   locale=locale('ko', encoding='euc-kr'),
                   na=".") %>% # csv 데이터 읽어오기
  mutate_if(is.character, as.factor)


ist_tb






# 5.저장하기
write_csv(ist_tb, "ist_tb.csv")


























