# 🕵️‍♀️ Fraud Detection Analysis & Predictive Modeling

A data-driven project that explores fraudulent transaction patterns and builds a predictive model for fraud detection.

## 📌 Overview

This project investigates financial fraud detection through exploratory data analysis (EDA) and logistic regression modeling.
It uncovers behavioral trends in transactions, validates findings with SQL, and evaluates the limitations of a baseline predictive model.

Dataset obtained from: [kaggle](https://www.kaggle.com/datasets/amanalisiddiqui/fraud-detection-dataset/data)

## 🧩 Dataset Description

Each record represents a transaction containing details such as type, amount, and account balances.

|Feature | Description |
|--------|-------------|
|step	| Time step (1 step = 1 hour)
|type	| Transaction type (e.g., CASH_OUT, TRANSFER, etc.)
|amount	| Transaction amount
|oldbalanceOrg, newbalanceOrig | Origin account balance before & after transaction
|oldbalanceDest, newbalanceDest |	Destination account balance before & after transaction
|isFraud |	Target variable (1 = Fraudulent, 0 = Non-fraudulent)


## 📊 Exploratory Data Analysis (EDA)

Visual Analyses Performed
| Visualization |	Purpose |
|---------------|---------|
|Bar plot |	Distribution of transaction types |
|Pie chart |	Fraud vs non-fraud transaction proportion |
|Bar plot |	Fraud vs non-fraud by transaction type |
|Line plot |	Number of transactions over time steps |
|Line plot |	Fraud transactions over time steps |
|Line plot |	Fraud rate (average fraud occurrence) over time |
|Boxplot |	Transaction amount by fraud status (log-scaled) |
|Boxplot |	Change in origin account balance by fraud status |
|Boxplot |	Change in destination account balance by fraud status |
|Heatmap |	Correlation between numerical features |

### 🧠 Key Insights

Transaction activity is high before 400 hours but drops sharply after,
while fraud transactions remain steady, becoming more noticeable post-400 hours.

Higher transaction amounts are more likely to be fraudulent.

Fraudulent transactions often involve a large change in the origin account balance.

The change in origin account balance shows the strongest correlation with fraud (r = 0.36).



## ⚙️ Predictive Modeling

### 🔧 Preprocessing & Pipeline

A ColumnTransformer and Pipeline were used to streamline preprocessing and modeling:

- Numerical features scaled using StandardScaler

- Categorical features encoded via OneHotEncoder

- Combined in a single logistic regression pipeline

### 🧾 Model Evaluation

|Metric |	Score |
|-------|-------|
|Accuracy |	0.95 |
|Precision (fraud) |	0.02 |
|Recall (fraud) |	0.96 |
|F1-score (fraud) |	0.05 |
### 📉 Interpretation

High recall and accuracy, but extremely low precision (0.02)
→ many non-fraud cases were wrongly flagged as fraud.

The imbalance between fraud and non-fraud cases skews the model’s performance.

Logistic regression’s linearity limits its ability to capture complex, nonlinear patterns typical in fraud detection.

## 🧾 SQL Validation

A corresponding PostgreSQL script was written to:

- Verify statistical summaries and group aggregations used in EDA

- Cross-check fraud distributions and transaction patterns

- Ensure data integrity between database queries and Python analyses

✅ Outcome: SQL results aligned with EDA findings, confirming analytical accuracy.

## 🚀 Next Steps

🧮 Handle Class Imbalance

Use SMOTE, RandomUnderSampler, or class weights

🌳 Explore Nonlinear Models

Try Random Forest, XGBoost, or LightGBM

🧠 Feature Engineering

Add features like transaction velocity, risk score, or account age

🔍 Anomaly Detection

Experiment with Isolation Forest, Autoencoders, or Local Outlier Factor (LOF)

📈 Evaluate with Better Metrics

Focus on Precision-Recall curves, ROC-AUC, and PR-AUC, not just accuracy

## 🧰 Tech Stack
|Category |	Tools Used |
|---------|------------|
|Language |	Python (3.9+) |
|Libraries |	Pandas, NumPy, Matplotlib, Seaborn, Scikit-learn |
|Database |	PostgreSQL |
|Environment |	Jupyter Notebook |

## 📈 Summary

✅ In-depth EDA to understand fraud patterns
✅ SQL validation for consistency and correctness
✅ Baseline logistic regression model with clear strengths and limitations
⚠️ Imbalanced dataset resulted in low precision — motivating next steps for model improvement

This notebook lays the groundwork for developing a more robust, production-level fraud detection system.
