# 📊 Energy Efficiency Data Analytics & Decision Support System (Sri Lanka Context)

![R](https://img.shields.io/badge/R-276DC3?style=for-the-badge&logo=r&logoColor=white)
![RStudio](https://img.shields.io/badge/RStudio-75AADB?style=for-the-badge&logo=RStudio&logoColor=white)
![Git](https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white)
![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)

---

## 📌 Executive Summary

This repository contains a comprehensive **Business Analytics and Statistical Research Study** aimed at identifying structural determinants of building energy efficiency. Conducted under the contextual framework of the **Ministry of Power and Renewable Energy (Sri Lanka)**, this study leverages statistical computing in **R** to analyze building cooling loads in relation to structural attributes (Surface Area, Wall Area, Roof Area, and Building Orientation).

The primary objective is to provide evidence-based insights for optimizing building cooling requirements, supporting sustainable infrastructure development, and managing national electricity demand.

---

## 📂 Repository Architecture

```text
├── EED.csv                        # Dataset (Energy Efficiency Data)
├── assignment_script.R            # Complete R analysis pipeline code
├── Energy_Efficiency_Report.pdf   # Comprehensive research paper & report
└── README.md                      # Project documentation and guide
````

## 🧪 Analytical Scope & Key Methodology

| Task | Analytical Domain | Statistical Techniques / Tools Used |
| :--- | :--- | :--- |
| **Task 1** | Analytics & BI Framework | Strategic, Tactical, Operational decision-support applications in Sri Lankan Energy Sector |
| **Task 2** | Tools & Methodologies | Open-source vs Closed-source comparison (R vs Commercial Software), Analytics workflow |
| **Task 3** | Exploratory Data Analysis | Central Tendency (Mean, Median, Mode), Variance, SD, Bell Curve distributions, Boxplots |
| **Task 4** | Hypothesis Testing | One-Way ANOVA, Kruskal-Wallis Test, Normality testing across Orientation groups |
| **Task 5** | Inferential Statistics | Shapiro-Wilk Normality Test, Q-Q Plots, Spearman Correlation, Bivariate Regression |
| **Task 6** | Predictive Modeling & Policy | Multiple Linear Regression, VIF Multicollinearity Diagnostic, Policy Recommendations |

---

## 🚀 Key Empirical Findings

1. **Building Orientation Impact (Task 4):**
   - Statistical hypothesis testing (ANOVA / Kruskal-Wallis) revealed **no statistically significant difference** in Cooling Load across different building orientations ($p > 0.05$).
2. **Structural Dimensions Impact (Task 5):**
   - **Surface Area & Roof Area:** Exhibited strong non-linear and linear relationships with Cooling Load.
   - **Wall Area:** Demonstrated a strong positive correlation ($r > 0.85$) with Cooling Load.
3. **Multi-Variable Regression (Task 6):**
   - Structural parameters account for a substantial proportion of variation in building cooling requirements ($R^2 > 0.88$).

---

## 🛠️ How to Execute the R Analysis Pipeline

### Prerequisites
Ensure you have **R** and **RStudio** installed on your environment.

### Installation & Execution
1. **Clone the Repository:**
   ```bash
   git clone [https://github.com/YOUR-USERNAME/Energy-Efficiency-Data-Analytics-R.git](https://github.com/YOUR-USERNAME/Energy-Efficiency-Data-Analytics-R.git)
   cd Energy-Efficiency-Data-Analytics-R
   ````

   1. **Install Required R Packages:**
   Open R / RStudio console and run:
   ```R
   install.packages("car")
   ````

   2. **Execute Analysis Script:**
   - Open `assignment_script.R` in RStudio.
   - Ensure `EED.csv` is located in your working directory.
   - Execute the script sequentially to output analytical models, statistical summaries, and diagnostic plots.

---

## 🏛️ Policy Implications for Sri Lanka

Based on the empirical findings, key policy interventions recommended for the Ministry of Power and Renewable Energy include:
- **Building Codes & Envelope Regulations:** Mandating minimum thermal performance standards for Wall and Roof areas in commercial construction.
- **Architectural Guidelines:** Prioritizing structural compactness over passive orientation alignment to minimize cooling load.
- **Smart Building Analytics:** Integrating analytical decision-support tools (OLAP, Data Warehousing) for urban power grid demand planning.

---

## 👤 Author
- **Name:** Malindu Vikash
- **Domain:** Data Entry / Analytics & Software Development
- **Target Institution:** Ministry of Power and Renewable Energy (Research Project Context)
