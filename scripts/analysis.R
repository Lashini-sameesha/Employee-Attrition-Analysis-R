employees <- read.csv("data/WA_Fn-UseC_-HR-Employee-Attrition.csv")
str(employees)
sum(is.na(employees))
sum(duplicated(employees))
sapply(employees, function(x) length(unique(x)))
employees_clean <- employees[, !(names(employees) %in% c("EmployeeCount", "Over18", "StandardHours"))]
dim(employees_clean)
#  Overall attrition rate 
table(employees_clean$Attrition)
prop.table(table(employees_clean$Attrition))

#  Attrition by Department 
table(employees_clean$Department, employees_clean$Attrition)

#  Attrition by OverTime 
table(employees_clean$OverTime, employees_clean$Attrition)

# Average monthly income by attrition 
aggregate(MonthlyIncome ~ Attrition, data = employees_clean, FUN = mean)

#  Average age by attrition 
aggregate(Age ~ Attrition, data = employees_clean, FUN = mean)

#  Average job satisfaction by attrition 
aggregate(JobSatisfaction ~ Attrition, data = employees_clean, FUN = mean)
#  Bar chart: Attrition rate by OverTime 
png("plots/attrition_by_overtime.png", width = 600, height = 400)
barplot(prop.table(table(employees_clean$OverTime, employees_clean$Attrition), margin = 1)[,"Yes"],
        col = c("#4CAF50", "#E53935"),
        main = "Attrition Rate by OverTime Status",
        ylab = "Proportion who left",
        names.arg = c("No Overtime", "Overtime"))
dev.off()

# Boxplot: Monthly income by attrition
png("plots/income_by_attrition.png", width = 600, height = 400)
boxplot(MonthlyIncome ~ Attrition, data = employees_clean,
        col = c("#4CAF50", "#E53935"),
        main = "Monthly Income by Attrition",
        ylab = "Monthly Income")
dev.off()
barplot(prop.table(table(employees_clean$OverTime, employees_clean$Attrition), margin = 1)[,"Yes"],
        col = c("#4CAF50", "#E53935"),
        main = "Attrition Rate by OverTime Status",
        ylab = "Proportion who left",
        names.arg = c("No Overtime", "Overtime"))
boxplot(MonthlyIncome ~ Attrition, data = employees_clean,
        col = c("#4CAF50", "#E53935"),
        main = "Monthly Income by Attrition",
        ylab = "Monthly Income")
#  Bar chart: Attrition rate by Department 
dept_table <- prop.table(table(employees_clean$Department, employees_clean$Attrition), margin = 1)
png("plots/attrition_by_department.png", width = 700, height = 400)
barplot(dept_table[,"Yes"],
        col = c("#2196F3", "#FF9800", "#E53935"),
        main = "Attrition Rate by Department",
        ylab = "Proportion who left",
        las = 1)
dev.off()

#  Age groups 
employees_clean$AgeGroup <- cut(employees_clean$Age,
                                breaks = c(17, 25, 35, 45, 60),
                                labels = c("18-25", "26-35", "36-45", "46-60"))

age_table <- prop.table(table(employees_clean$AgeGroup, employees_clean$Attrition), margin = 1)
png("plots/attrition_by_agegroup.png", width = 600, height = 400)
barplot(age_table[,"Yes"],
        col = "#9C27B0",
        main = "Attrition Rate by Age Group",
        ylab = "Proportion who left",
        xlab = "Age Group")
dev.off()
