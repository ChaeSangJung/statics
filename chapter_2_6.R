# 패키지 로드
library(ggplot2)
library(forcats)

# 데이터 입력
transp <- c("bicycle", "bus", "bus", "walking", "bus", "bicycle", "bicycle", 
            "bus", "bus", "bus", "bicycle", "bus", "bicycle", "bicycle", 
            "walking", "bus", "bus", "bicycle", "bicycle", "walking", 
            "walking", "bicycle", "bus", "bus", "bus", "bus", "bicycle", 
            "bus", "bus", "bicycle", "bicycle", "bicycle")

dat1 <- data.frame(transp)

# 막대그래프 작성
ggplot(data = dat1) + 
  geom_bar(mapping = aes(x = fct_infreq(transp))) + 
  xlab("Transportation")

# transp_factor <- as.factor(transp)
# summary(transp_factor)
# barplot(summary(transp_factor))

# 데이터 입력
obesity <- factor(
  c("underweight", "normal", "overweight", "obese"),
  levels = c("underweight", "normal", "overweight", "obese")
)
count <- c(6, 69, 27, 13)
perc <- count / sum(count) * 100
dat2 <- data.frame(obesity, count, perc)

# 막대그래프 작성
ggplot(data = dat2) +
  geom_bar(mapping = aes(x = obesity, y = perc), stat = "identity") +
  xlab("Obesity") +
  ylab("Percentage (%)")
