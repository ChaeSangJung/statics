name = c("Kim", "Lee", "Park", "Choi")
age = c(20, 32, 17, 51)
sex = as.factor(c("Male", "Female", "Female", "Female"))
# sex = c("Male", "Female", "Female", "Female")

# sex는 as.factor()를 통해 **범주형(팩터)**으로 변환했어요!
# → 나중에 그룹별 통계나 시각화 시 매우 유용✨

dat = data.frame(name, age, sex)

dat$name
dat$age
dat$sex

dat

summary(sex)
# 범주형으로 변환하는 이유는 summary해보면 알 수 있음