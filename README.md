# 🚚 Smart Supply Chain Analytics: End-to-End Analytics & Predictive Modeling

![Power BI](https://img.shields.io/badge/Power_BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Scikit-Learn](https://img.shields.io/badge/Scikit--Learn-F7931E?style=for-the-badge&logo=scikit-learn&logoColor=white)

An end-to-end data engineering, exploratory data analysis (EDA), and machine learning pipeline designed to monitor supply chain operations, analyze late delivery risks, evaluate fraud risks, and optimize inventory & fulfillment performance.

---

## 📌 Project Overview

Supply chain disruptions and late deliveries lead to significant revenue loss and degraded customer satisfaction. This project analyzes multi-region supply chain data using **SQL**, **Python**, and **Power BI** to extract operational KPIs, clean raw transactions, build predictive models for shipping delays, and visualize executive performance metrics.

---

## 🏗️ Repository Architecture

```text
SMART-SUPPLY-CHAIN-ANALYTICS/
├── 01_sql_scripts/
│   └── 01_kpi_extraction.sql         # SQL queries for revenue, late risk, and order metrics
├── 02_python_eda/
│   └── 02_supply_chain_cleaning_eda.ipynb # Data cleaning, feature engineering & ML modeling
├── 03_power_bi/
│   └── smart_supply_chain_analytics.pbix  # Executive interactive Power BI dashboard
├── data/
│   └── (cleaned_supply_chain_data.csv) # Output dataset generated via Python pipeline
├── .gitignore                         # Configured Git tracking exclusions
├── README.md                          # Project documentation
└── requirements.txt                   # Project dependencies

🛠️ Tech Stack & Tools
Database & Querying: MySQL / SQLAlchemy / PyMySQL

Data Wrangling & Analysis: Python (pandas, numpy)

Visualization & Dashboarding: Power BI, seaborn, matplotlib

Machine Learning: scikit-learn (Random Forest / Logistic Regression classification for late risk)

🔑 Key Features & Pipeline Workflow
1️⃣ Database Ingestion & SQL KPI Extraction (01_sql_scripts/)
Raw transactional datasets loaded into local MySQL database (supply_chain_db).

SQL scripts executed using CTEs and window functions to extract aggregate revenue, profit margins, late delivery ratios, and regional performance.

2️⃣ Python EDA, Data Cleaning & Predictive Modeling (02_python_eda/)
Established secure database connection via SQLAlchemy.

Cleaned raw transactional features, handled missing values, and encoded categorical variables.

Built Machine Learning models to predict Late Delivery Risk (Late_delivery_risk) based on shipping modes, product categories, order regions, and processing lead times.

Exported cleaned dataset to data/cleaned_supply_chain_data.csv.

3️⃣ Executive Dashboard (03_power_bi/)
Interactive Power BI dashboard (smart_supply_chain_analytics.pbix) featuring:

Executive Overview: Total Revenue, Total Profit, Profit Margin %, and Order Volume.

Fulfillment Analysis: Late Delivery Rate %, On-Time Shipping performance across carriers.

Geographic & Category Insights: Sales and profitability breakdown by Market, Region, and Product Category.

🚀 How to Run locally
Prerequisites
Python 3.10+

MySQL Server

Power BI Desktop (to view .pbix)

Setup Environment
Clone the repository:

git clone [https://github.com/anuranjpv/smart-supply-chain-analytics.git](https://github.com/anuranjpv/smart-supply-chain-analytics.git)
cd smart-supply-chain-analytics

Install Python dependencies:

pip install -r requirements.txt

Database Configuration:

Load your MySQL schema into supply_chain_db.

Update your connection string placeholder in 02_python_eda/02_supply_chain_cleaning_eda.ipynb:
engine = create_engine('mysql+pymysql://root:YOUR_PASSWORD@localhost:3306/supply_chain_db')

Run Notebook:

Open and run 02_supply_chain_cleaning_eda.ipynb to process raw data and generate the output CSV file.

📈 Key Insights & Business Impact
Shipping Mode Bottlenecks: Standard Class shipping shows higher variance in actual shipping days compared to Scheduled shipping days.

Geographic Risk: Specific regional markets exhibit elevated late delivery rates, providing key targets for logistical optimization.

Predictive Accuracy: Machine Learning classification models effectively flag high-risk orders prior to dispatch, enabling proactive customer notification and dispatch prioritization.

👤 Author
Anuranj P V - Data Analyst / Computer Science Student

GitHub: @anuranjpv