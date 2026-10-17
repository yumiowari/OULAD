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

# 1. Exibe a distribuição de alunos por gênero
gender_donut(studentInfo)

# 2. Exibe a distribuição de alunos por idades
age_donut(studentInfo)

# 3. Exibe a distribuição de alunos por região
region_donut(studentInfo)