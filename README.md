

# Government Scheme Usage Analytics (India-Focused)


<img width="1536" height="1024" alt="Image" src="https://github.com/user-attachments/assets/826272dd-e454-442c-a81f-8bedfded7b9c" />


> **Advanced SQL Analytics Project (PostgreSQL)**

---

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
<img width="991" height="330" alt="Image" src="https://github.com/user-attachments/assets/d2cf6136-ed5c-47c2-a9f6-b8fdf485032e" />


#### Output
<img width="722" height="212" alt="Image" src="https://github.com/user-attachments/assets/deabadf2-6f70-464d-9225-afac26c5fb8c" />


**Insights:**
-All schemes have utilization % around 14–15%, which is very low compared to total allocated funds. 
-Shows most funds are yet to be utilized or released slowly.
-Could indicate bureaucratic delays, administrative inefficiencies, or phased implementation.

---

### 2️⃣ District-Level Fund Efficiency

**Goal:** Compare utilization efficiency across districts after normalization.

#### SQL Query
<img width="1115" height="343" alt="Image" src="https://github.com/user-attachments/assets/56e896d1-9bb9-4f24-8c07-ada40111ef81" />

#### Output
<img width="688" height="210" alt="Image" src="https://github.com/user-attachments/assets/0a61e142-37ce-4732-853e-552e1480e36c" />


**Insights:**
- District utilization percentages are closely distributed
- Minor variations highlight administrative efficiency differences

---

### 3️⃣ Spending Volatility & Stability Analysis

**Goal:** Classify schemes based on consistency of fund usage.

#### SQL Query
<img width="886" height="372" alt="Image" src="https://github.com/user-attachments/assets/ff5da167-c535-4ee7-a410-b82d26228549" />

#### Output
<img width="601" height="208" alt="Image" src="https://github.com/user-attachments/assets/ef0397ab-f227-4720-92b2-60f8b75c58a3" />

 **Categorized into:**
- **Stable Spending** :- Consistent fund usage  
- **Inconsistent Spending** :- High variability 

---

##  Dashboards & Visualizations

Dashboards were created using **pgAdmin Graph Visualizer**.

### Scheme Utilization Dashboard
<img width="1283" height="502" alt="Image" src="https://github.com/user-attachments/assets/4f7029db-ff13-4c7d-8c80-6dda1c4d831c" />


### District Efficiency Dashboard
<img width="1277" height="476" alt="Image" src="https://github.com/user-attachments/assets/84cf3654-accd-40b6-9630-6fcba3787475" />


### Scheme Stability Dashboard
<img width="1282" height="577" alt="Image" src="https://github.com/user-attachments/assets/60cc6c0e-25e2-4b75-b69b-e462388590f6" />


---

## Business Questions Solved-

This project addresses the following key business questions:

1. **.How much money was allocated vs how much was actually utilized across all government schemes?**
   

   <img width="558" height="268" alt="Image" src="https://github.com/user-attachments/assets/3e03199e-d754-4272-a608-9761857e9496" />
   

- Analyzed budget efficiency by comparing total fund allocations with actual utilization to identify under-utilized public schemes.

   
   
2. **Which government schemes are efficiently utilizing their allocated funds and which are underperforming?**

   <img width="691" height="407" alt="Image" src="https://github.com/user-attachments/assets/7fe16389-bee5-48c8-96c9-649549ea5b2f" />
   

* High utilization (>20%):-
   - Effective outreach
   - Smooth fund release
   - High beneficiary demand
   
* Low utilization (<10%)
   - Implementation bottlenecks
   - Awareness gaps
   - Possible policy redesign needed
  
     

3. **Which districts are utilizing government funds effectively and which are lagging behind?**
   

   <img width="527" height="232" alt="Image" src="https://github.com/user-attachments/assets/d634ff45-d353-4c75-a242-b7339d8b9cae" />
   

- District-wise analysis reveals uneven fund absorption, highlighting the need for targeted administrative strengthening in lagging districts.
  
     

4. **Which districts are more efficient in utilizing funds relative to the schemes implemented within them?**
   

   <img width="717" height="360" alt="Image" src="https://github.com/user-attachments/assets/dcbd3c83-88a1-4b08-9634-6af6c854024d" />
   

- District-level utilization efficiency shows limited variation, indicating systemic execution constraints rather than localized administrative failures.
  
     
  
 **Advanced Analytical Insights--**


1. **Identify Under-Utilized Schemes**
   
   <img width="736" height="376" alt="Image" src="https://github.com/user-attachments/assets/28e69082-4532-4c64-a305-8e2cd35a384c" />
   

- This query highlights schemes that are naturally under-utilized due to timing, approvals, or processes, helping focus administrative support instead of simply increasing budgets.
     

    
2. **Districts at Financial Execution Risk.**

   <img width="840" height="442" alt="Image" src="https://github.com/user-attachments/assets/7b68307c-1bce-443e-aefc-2e0ab7c273aa" />
   

* Low Utilization ≠ Problem
- Often happens due to:
   - Waiting on approvals – processes take time.
   - Seasonal timing – some work can only happen at certain times.
   - Procurement delays – finding the right vendors takes a while.

     

3. **Scheme Stability Index (Advanced Metric).Identify schemes with consistent utilization behavior(Stable execution is valued more than spikes)**
   

   <img width="743" height="311" alt="Image" src="https://github.com/user-attachments/assets/f2525bdf-7c71-43ff-a139-3d1d094ca746" />


Low volatility :- predictable governance
High volatility :- funding shocks / admin issues




##  Key Insights Summary

- Stable schemes show predictable utilization patterns
- Volatile schemes require closer monitoring
- District-wise normalization provides realistic efficiency metrics
- SQL-based analytics can directly support policy decisions

 
