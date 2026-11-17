library(data.table)

assessments <- fread("data/assessments.csv")
courses <- fread("data/courses.csv")
studentAssessment <- fread("data/studentAssessment.csv")
studentInfo <- fread("data/studentInfo.csv")
studentRegistration <- fread("data/studentRegistration.csv")
studentVle <- fread("data/studentVle.csv")
vle <- fread("data/vle.csv")

# Carrega os gráficos de rosca
source("donuts.R")

# Carrega os gráficos de barra
source("bars.R")

# 1. Exibe a distribuição de alunos por gênero
gender_donut(studentInfo)

# 2. Exibe a distribuição de alunos por grupo de idade
age_donut(studentInfo)

# 3. Exibe a distribuição de alunos por região
#region_donut(studentInfo)
region_bar(studentInfo)

# 4. Exibe a distribuição de alunos por nível de escolaridade
highest_education_donut(studentInfo)

# 5. Exibe a distribuição de alunos por resultado final
final_result_donut(studentInfo)