

# Government Scheme Usage Analytics (India-Focused)


![image alt](https://github.com/Deeppatil05/Government_Scheme_Usage_Analytics/blob/baca32296aa8171a589df96c98d3d2aac018f90f/assets/ChatGPT%20Image%20Jan%2016%2C%202026%2C%2006_40_26%20PM.png)


> **Advanced SQL Analytics Project (PostgreSQL)**

---

**Note: The dataset used in this project is synthetic and created for analytical demonstration purposes.**


##  Project Objective

This project analyzes **government scheme fund allocation and utilization** across districts in India to evaluate efficiency, stability, and spending variability.

The analysis focuses on:
- Scheme-level utilization efficiency
- District-wise fund utilization
- Volatility-based spending classification

---

##  Why This Project Is Impactful?

Public fund utilization is a critical governance challenge.  
This project simulates a **real-world policy analytics scenario**, similar to work done by:
- Government auditors
- Public finance analysts
- Consulting firms
- Social impact organizations

---

##  Tools & Technologies

- **Database:** PostgreSQL  
- **Language:** SQL  
- **Visualization:** pgAdmin visualizer
- **Concepts Used:**  
  - Multi-table joins  
  - Aggregations  
  - Statistical functions (`STDDEV`)  
  - CASE-based classification  
  - Views & reusable logic  

---

##  Analysis Performed---------


### 1️⃣ Scheme-Level Utilization Analysis

**Goal:** Identify how efficiently each government scheme uses allocated funds.

#### SQL Query
![image alt](https://github.com/Deeppatil05/Government_Scheme_Usage_Analytics/blob/95ff04dc9d11355209ebfc8e57dec7e50ea63b96/assets/SU.png)


#### Output
![image alt](https://github.com/Deeppatil05/Government_Scheme_Usage_Analytics/blob/0a7ccb766a6c3534cece4e8b022b107c098a798c/assets/O-SU.png)


**Insights:**
-All schemes have utilization % around 14–15%, which is very low compared to total allocated funds. 
-Shows most funds are yet to be utilized or released slowly.
-Could indicate bureaucratic delays, administrative inefficiencies, or phased implementation.

---

### 2️⃣ District-Level Fund Efficiency

**Goal:** Compare utilization efficiency across districts after normalization.

#### SQL Query
![image alt](https://github.com/Deeppatil05/Government_Scheme_Usage_Analytics/blob/0a7ccb766a6c3534cece4e8b022b107c098a798c/assets/DU.png)
#### Output
![image alt](https://github.com/Deeppatil05/Government_Scheme_Usage_Analytics/blob/0a7ccb766a6c3534cece4e8b022b107c098a798c/assets/O-DU.png)


**Insights:**
- District utilization percentages are closely distributed
- Minor variations highlight administrative efficiency differences

---

### 3️⃣ Spending Volatility & Stability Analysis

**Goal:** Classify schemes based on consistency of fund usage.

#### SQL Query
![image alt](https://github.com/Deeppatil05/Government_Scheme_Usage_Analytics/blob/0a7ccb766a6c3534cece4e8b022b107c098a798c/assets/SV.png)

#### Output
![image alt](https://github.com/Deeppatil05/Government_Scheme_Usage_Analytics/blob/0a7ccb766a6c3534cece4e8b022b107c098a798c/assets/O-SV.png)
 **Categorized into:**
- **Stable Spending** :- Consistent fund usage  
- **Inconsistent Spending** :- High variability 

---

##  Dashboards & Visualizations

Dashboards were created using **pgAdmin Graph Visualizer**.

### Scheme Utilization Dashboard
![image alt](https://github.com/Deeppatil05/Government_Scheme_Usage_Analytics/blob/0a7ccb766a6c3534cece4e8b022b107c098a798c/assets/G-SU.png)


### District Efficiency Dashboard
![image alt](https://github.com/Deeppatil05/Government_Scheme_Usage_Analytics/blob/0a7ccb766a6c3534cece4e8b022b107c098a798c/assets/G-DU.png)


### Scheme Stability Dashboard
![image alt](https://github.com/Deeppatil05/Government_Scheme_Usage_Analytics/blob/0a7ccb766a6c3534cece4e8b022b107c098a798c/assets/G-SV.png)


---

## Business Questions Solved-

This project addresses the following key business questions:

1. **.How much money was allocated vs how much was actually utilized across all government schemes?**
   
![image alt](https://github.com/Deeppatil05/Government_Scheme_Usage_Analytics/blob/0a7ccb766a6c3534cece4e8b022b107c098a798c/assets/Q1.png)

- Analyzed budget efficiency by comparing total fund allocations with actual utilization to identify under-utilized public schemes.

   
   
2. **Which government schemes are efficiently utilizing their allocated funds and which are underperforming?**

   ![image alt](https://github.com/Deeppatil05/Government_Scheme_Usage_Analytics/blob/0a7ccb766a6c3534cece4e8b022b107c098a798c/assets/Q2.png)
   

* High utilization (>20%):-
   - Effective outreach
   - Smooth fund release
   - High beneficiary demand
   
* Low utilization (<10%)
   - Implementation bottlenecks
   - Awareness gaps
   - Possible policy redesign needed
  
     

3. **Which districts are utilizing government funds effectively and which are lagging behind?**
   

  ![image alt](https://github.com/Deeppatil05/Government_Scheme_Usage_Analytics/blob/0a7ccb766a6c3534cece4e8b022b107c098a798c/assets/Q3.png)

- District-wise analysis reveals uneven fund absorption, highlighting the need for targeted administrative strengthening in lagging districts.
  
     

4. **Which districts are more efficient in utilizing funds relative to the schemes implemented within them?**
   

  ![image alt](https://github.com/Deeppatil05/Government_Scheme_Usage_Analytics/blob/0a7ccb766a6c3534cece4e8b022b107c098a798c/assets/Q4.png)
   

- District-level utilization efficiency shows limited variation, indicating systemic execution constraints rather than localized administrative failures.
  
     
  
 **Advanced Analytical Insights--**


1. **Identify Under-Utilized Schemes**
   
  ![image alt](https://github.com/Deeppatil05/Government_Scheme_Usage_Analytics/blob/0a7ccb766a6c3534cece4e8b022b107c098a798c/assets/Q5.png)

- This query highlights schemes that are naturally under-utilized due to timing, approvals, or processes, helping focus administrative support instead of simply increasing budgets.
     

    
2. **Districts at Financial Execution Risk.**

 ![image alt](https://github.com/Deeppatil05/Government_Scheme_Usage_Analytics/blob/0a7ccb766a6c3534cece4e8b022b107c098a798c/assets/Q6.png)
   

* Low Utilization ≠ Problem
- Often happens due to:
   - Waiting on approvals – processes take time.
   - Seasonal timing – some work can only happen at certain times.
   - Procurement delays – finding the right vendors takes a while.

     

3. **Scheme Stability Index (Advanced Metric).Identify schemes with consistent utilization behavior(Stable execution is valued more than spikes)**
   

  ![image alt](https://github.com/Deeppatil05/Government_Scheme_Usage_Analytics/blob/0a7ccb766a6c3534cece4e8b022b107c098a798c/assets/Q7.png)

Low volatility :- predictable governance
High volatility :- funding shocks / admin issues




##  Key Insights Summary

- Stable schemes show predictable utilization patterns
- Volatile schemes require closer monitoring
- District-wise normalization provides realistic efficiency metrics
- SQL-based analytics can directly support policy decisions

 
