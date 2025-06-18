# 2-1 객체 (Object)
a = 1     # a라는 객체에 1을 저장
b = 2     # b라는 객체에 2를 저장
c = a + b # c에 a와 b의 합을 저장
c          # 출력 결과: 3

# <- 또는 =는 대입 연산자
# 객체 이름은 대소문자 구분, 숫자나 _로 시작 불가
# 출력: 객체 이름만 입력하면 값 출력

# 2-2 벡터 (Vector)
# 동일한 데이터 타입의 값들이 모인 1차원 배열
height = c(165, 151, 162, 168, 151, 152, 159, 163, 143, 161)

# c() 함수로 요소를 쉼표로 나열해 생성
# 예: 학생 10명의 키를 벡터로 저장

# 2-3. 다양한 벡터 생성
d = 1:3               # 1, 2, 3
e <- seq(1, 9, 2)      # 1, 3, 5, 7, 9 (1부터 9까지 2씩 증가)
f <- rep(10, 5)        # 10이 5번 반복
g <- c(d, f)           # d와 f를 결합
h <- c(4:1, seq(0, 9, 3))  # 4,3,2,1,0,3,6,9

# 2-4. 벡터 연산
e + f   # 동일 위치 요소끼리 연산 (재활용됨)
e - f
e * f
e / f
d + f   # 길이가 다르면 재활용(recycling)되며 경고 발생 가능

# 2-5. 다양한 데이터형 객체
i = 1:4                  # 숫자형
j = as.factor(1:4)       # 범주형 (factor)
j_1 = factor(1:4, levels = 1:4, labels = c("A", "B", "C", "D"))
# 1:4: 실제 데이터 값 (1, 2, 3, 4)
# levels = 1:4: 기준이 되는 범주값은 1, 2, 3, 4
# labels = c("A", "B", "C", "D"): 각각의 level에 붙일 이름
# 즉, 이 벡터는 A, B, C, D라는 **4개의 범주(factor level)**를 가지며, 각각은 내부적으로 1, 2, 3, 4라는 숫자에 대응
# 범주는 4개이며, 각각 이름은 "A", "B", "C", "D"이다.
# 내부적으로는 정수형 인덱스를 가지며, 그에 대응하는 이름이 labels로 표시됨.

# levels란?
# factor 객체에 정의된 모든 범주의 고정된 목록
# 즉, factor형 벡터가 가질 수 있는 **"가능한 값의 집합"**을 의미

j_2 = factor(c("apple", "banana", "apple", "orange"))
levels(j_2)
# [1] "apple" "banana" "orange"
# j_2는 문자열 4개를 가진 factor
# levels(j_2)는 → "apple", "banana", "orange"
# 데이터 검토	어떤 범주들이 있는지 확인 (levels(factor변수))
# 시각화 순서 설정	ggplot, boxplot 등에서 범주 순서 조절 가능
# 레벨 이름 수정	levels(x) <- c("A", "B", "C") 등으로 직접 수정 가능

k <- as.character(1:4)    # 문자형
l <- c("K", "N", "O", "U")# 문자형 직접 입력
m <- i > 2                # 논리형 (TRUE, FALSE)

# 2-6 행렬 (Matrix)
n <- rep(10, 5)           # 벡터
o <- 1:5
p <- cbind(n, o)          # 열 방향 결합 (column bind)
q <- rbind(n, o)          # 행 방향 결합 (row bind)

r <- matrix(1:4, 2, 2)    # 2x2 행렬
s <- matrix(c(1, 4, 2, 7), 2, 2)  # 직접 입력

r + s                     # 행렬 덧셈
r %*% s                   # 행렬 곱셈
solve(s)                  # 역행렬
s[1,2]                    # 1행 2열 요소
s[1,]                     # 1행 전체
s[,2]                     # 2열 전체

# matrix()는 행부터 채우는가? 열부터 채우는가?
# 기본값은 열(column)부터 채운다.

# matrix(c(1, 4, 2, 7), nrow = 2, ncol = 2)
# ⬇️ 결과는 아래와 같아. 열 우선으로 채워지기 때문에:
#     [,1] [,2]
# [1,]  1   2
# [2,]  4   7

# 만약 행부터 채우고 싶으면 byrow = TRUE 옵션을 사용해야 해.
# matrix(c(1, 4, 2, 7), nrow = 2, byrow = TRUE)
# ⬇️ 그러면 이렇게 나와:
#     [,1] [,2]
# [1,] 1    4
# [2,] 2    7

# 2-7. 데이터 프레임 (Data Frame)
name <- c("Kim", "Lee", "Park", "Choi")
age <- c(20, 32, 17, 51)
sex <- as.factor(c("Male", "Female", "Female", "Female"))

dat <- data.frame(name, age, sex)

dat$name      # 이름 열
dat$age       # 나이 열
dat$sex       # 성별 열
dat

# 데이터 프레임에서 sex <- as.factor(c("Male", "Female", "Female", "Female")) 이부분은 왜 벡터가 아니고 범주형
# ✅ c("Male", "Female", "Female", "Female")는 기본적으로 문자형 벡터야.
# sex <- c("Male", "Female", "Female", "Female")
# ⬆️ 이건 문자형(character) 벡터야.
# 즉, 문자열 4개가 나열된 단순한 텍스트 집합일 뿐이야.

# ✅ 그런데 as.factor(...)로 감싸면?
# sex <- as.factor(c("Male", "Female", "Female", "Female"))
# ⬆️ 이건 이제 "범주형 데이터로 해석하겠다"는 의도를 담은 코드야.
# 🔍 왜 factor로 바꾸는가?
# 문자형 벡터	                범주형 factor
# 그냥 문자열	                의미 있는 그룹(범주)
# 텍스트 처리에 적합	        통계 분석/시각화에 적합
# 정렬, 검색 등 문자열 중심	  그룹별 평균, 빈도, 상자그림 등 가능

# 예: 성별 데이터를 다룰 때
# "Male"과 "Female"은 단순한 문자열이라기보다는
# → "성별"이라는 **분류 기준(범주)**이야.
# 이럴 땐 as.factor()로 바꿔주면, R은 이것을 **"이산형 변수"**로 인식해.

# ✅ factor로 바꿨을 때 이점
summary(sex)
# ⬇️ 결과:
  
# Female   Male 
# 3       1
# 문자열이면 summary 안 됨

# factor이니까 범주별 빈도를 자동으로 계산해 줘

# 📌 정리하면:
# as.factor()를 쓰는 이유는 단순한 문자열을 통계적으로 의미 있는 "범주" 데이터로 바꾸기 위해서야.

# 그래서 성별, 지역, 등급, 직급, 학점 등은 character가 아니라 factor로 다루는 게 통계적 분석에 유리하지.

# ✅ factor의 본질
# "이 값들은 단순한 개별 값이 아니라, 서로 다른 범주(그룹)에 속해 있어요!"
# 라고 R에게 알려주는 거야.