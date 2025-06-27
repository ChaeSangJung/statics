# 🌟 fct_infreq(transp) 이란?
# fct_infreq()는 **빈도순(frequency order)**으로 factor 레벨을 정렬해주는 함수

# fct_infreq()를 쓰려면 꼭 forcats 패키지가 필요하니, library(forcats) 로드 필수

# fct_rev() → 역순 정렬
# fct_reorder() → 평균값 등 다른 기준으로 재정렬 가능!

# 패키지 로드
library(ggplot2)
library(forcats)

# 데이터 입력
transp <- c("bicycle", "bus", "bus", "walking", "bus", "bicycle",
            "bus", "bus", "bus", "bicycle", "bus", "bicycle", "bicycle",
            "walking", "bus", "bus", "bicycle", "bicycle", "walking", "walking",
            "bicycle", "bus", "bus", "bus", "bus", "bicycle", "bus", "bus",
            "bicycle", "bicycle", "bicycle")
# 범주화
transf = as.factor(transp)

# 데이터 프레임 생성
dat1 <- data.frame(transp)
dat2 <- data.frame(transf)

# 막대그래프 작성
ggplot(data = dat1) + geom_bar(mapping = aes(x = fct_infreq(transp))) + xlab("Transportation")
ggplot(data = dat2) + geom_bar(mapping = aes(x=transf)) + xlab("Transportation")
