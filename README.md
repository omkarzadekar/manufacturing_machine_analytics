# Manufacturing Machine Failure Analysis

## 📌 Project Overview

This project focuses on analyzing machine performance data to identify key factors contributing to machine failures in a manufacturing environment. The objective is to uncover actionable insights that can help reduce downtime, improve maintenance strategies, and optimize machine efficiency.

---

## 🎯 Objectives

* Identify which machine types have the highest failure rates
* Analyze the impact of operational parameters (Torque, Tool Wear, Temperature)
* Detect critical thresholds leading to failures
* Provide data-driven recommendations for preventive maintenance

---

## 🛠️ Tools & Technologies Used

* **SQL** – Data cleaning, transformation, and analysis
* **Power BI** – Data visualization and dashboard creation
* **Excel** – Initial data exploration

---

## 📊 Dataset Overview

* Total Records: 10,000
* Total Failures: 339
* Failure Rate: 3.39%

### Key Features:

* Machine Type (H, M, L)
* Air Temperature
* Process Temperature
* Rotational Speed
* Torque
* Tool Wear
* Failure Types (TWF, HDF, PWF, OSF, RNF)

---

## 🔍 Key Insights

### 1️⃣ Failure by Machine Type

* Type **L machines** have the highest failure rate (~3.92%)
* Indicates higher operational stress or usage

### 2️⃣ Impact of Torque

* Failed machines show **higher average torque (50.17)** vs non-failed (39.63)
* High torque is a strong indicator of failure

### 3️⃣ Tool Wear Analysis

* Failed machines have significantly higher tool wear (143.78)
* Tool wear is directly proportional to failure risk

### 4️⃣ Critical Threshold Detection

* Failure rate jumps to **15.49% when tool wear exceeds 200**
* This is ~5x higher than normal ranges

### 5️⃣ Failure Type Breakdown

* OSF (Overstrain Failure) shows highest torque impact
* HDF and PWF are also significant contributors

### 6️⃣ Temperature Impact

* Temperature difference has minimal effect on failure
* Not a strong predictor in this dataset

---

## 📈 Dashboard Features

* KPI Cards (Total Records, Failures, Failure Rate, Avg Tool Wear)
* Failure Rate by Machine Type
* Torque vs Machine Failure
* Tool Wear vs Machine Failure
* Critical Tool Wear Threshold Analysis
* Failure Type Breakdown (Donut Chart)
* Interactive Filters (Torque, Rotational Speed, Machine Type)

---

## 💡 Business Recommendations

* Implement **preventive maintenance before tool wear exceeds 200**
* Monitor and control **high torque conditions**
* Prioritize inspection for **Type L machines**
* Use predictive analytics to detect early failure signals

---

## 🚀 Project Outcome

This analysis helps manufacturing teams:

* Reduce unexpected machine breakdowns
* Optimize maintenance schedules
* Improve operational efficiency
* Lower operational costs

---

## 📷 Dashboard Preview

<img width="1326" height="743" alt="Screenshot (18)" src="https://github.com/user-attachments/assets/0a958a87-226b-4e2b-b536-e29d53e17efd" />


---

## 🔗 Future Improvements

* Build a predictive model using Machine Learning
* Integrate real-time IoT data
* Automate alert system for high-risk conditions

---

## 👨‍💻 Author

**Omkar Zadekar**

* Data Analyst
* Skilled in SQL, Power BI, Python
