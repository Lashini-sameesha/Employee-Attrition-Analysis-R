# Employee Attrition Analysis (R)

A data analysis project exploring employee attrition patterns using the **IBM HR Analytics Employee Attrition & Performance** dataset. This is a fictional dataset created by IBM data scientists for training and demonstration purposes — it does not represent a real company.

## Live Dashboard

🔗 **[View the interactive Shiny dashboard]([https://connect.posit.cloud/lashini-sameesha/content/01a01490-1260-e834-16c6-dfe845eee0de](https://01a01490-1260-e834-16c6-dfe845eee0de.share.connect.posit.cloud/))**

## Project Goal

Identify which factors are most strongly associated with employees leaving the company (attrition), using data cleaning, exploratory data analysis, and visualization in R.

## Dataset

- **Source:** [IBM HR Analytics Employee Attrition & Performance (Kaggle)](https://www.kaggle.com/datasets/pavansubhasht/ibm-hr-analytics-attrition-dataset)
- **Size:** 1,470 employee records, 35 variables
- **Key variables:** Age, Department, JobRole, MonthlyIncome, JobSatisfaction, OverTime, YearsAtCompany, Attrition

## Project Structure


## Methodology

1. **Data Loading** — Imported the CSV with `read.csv()` and verified structure with `str()`.
2. **Data Cleaning**
   - Checked for missing values (`sum(is.na())`) → **0 found**
   - Checked for duplicate rows (`sum(duplicated())`) → **0 found**
   - Identified and removed 3 constant columns with no analytical value: `EmployeeCount`, `Over18`, `StandardHours`
   - Resulting clean dataset: 1,470 rows × 32 columns
3. **Exploratory Data Analysis** — Used `table()`, `prop.table()`, and `aggregate()` to compare attrition rates and averages across groups.
4. **Visualization** — Created bar charts and a boxplot with base R graphics, saved to the `plots/` folder.
5. **Interactive Dashboard** — Built a Shiny app (`shiny_app/app.R`) using `ggplot2`, letting users switch between Department, OverTime, JobRole, and MaritalStatus to explore attrition patterns live. Deployed to Posit Connect Cloud.

## Key Findings

| Finding | Detail |
|---|---|
| **Overall attrition rate** | 16.1% of employees left (237 of 1,470) |
| **OverTime is the strongest driver** | Employees working overtime left at ~30.5%, nearly 3x higher than those who don't (~10.4%) |
| **Department differences** | Sales (20.6%) and HR (19.0%) had higher attrition than R&D (13.8%) |
| **Income gap** | Employees who left earned less on average ($4,787 vs $6,833) |
| **Age** | Employees who left were younger on average (33.6 vs 37.6 years) |
| **Job satisfaction** | Slightly lower among those who left (2.47 vs 2.78 on a 4-point scale) — a real but weaker effect |

## Visualizations

- `attrition_by_overtime.png` — Attrition rate by OverTime status
- `income_by_attrition.png` — Monthly income distribution by attrition
- `attrition_by_department.png` — Attrition rate by department
- `attrition_by_agegroup.png` — Attrition rate by age group

## Tools Used

- R (base R: `read.csv`, `table`, `aggregate`, `barplot`, `boxplot`)
- R Shiny + ggplot2 (interactive dashboard)
- RStudio
- Posit Connect Cloud (deployment)

## Next Steps

- Add a simple predictive model (logistic regression) for attrition risk
- Add more filter dimensions to the Shiny dashboard (e.g. income range, age)

## Author

Built as a personal learning project to practice data cleaning, EDA, and visualization in R.
