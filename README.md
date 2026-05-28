# E-commerce Funnel Analysis using SQL & BigQuery

## 📌 Project Overview

This project analyzes customer behavior across an e-commerce sales funnel using SQL and Google BigQuery.

The analysis focuses on:
- User conversion behavior
- Funnel drop-offs
- Revenue KPIs
- Customer purchase journey
- Business optimization opportunities

The goal was to transform raw event-level data into actionable business insights using SQL queries and analytical thinking.

---

## 🛠 Tools Used

- Google BigQuery
- SQL
- Google Cloud Platform (GCP)

---

## 📂 Dataset Information

The dataset contains user interaction events from an e-commerce platform, including:
- Page Views
- Add to Cart
- Checkout Start
- Payment Information
- Purchases

Each row represents a user activity event with:
- user_id
- event_type
- event_date
- amount
- traffic_source

---

## 📊 Funnel Analysis Performed

The project analyzed the complete customer purchase funnel:

```text
Page View → Add to Cart → Checkout → Payment → Purchase
```

Metrics calculated:
- Funnel conversion rates
- Checkout completion rates
- Payment conversion rates
- Overall conversion ratio
- Revenue metrics
- Average Order Value (AOV)
- Revenue per visitor
- Revenue per order
- User journey analysis
- Time-to-conversion analysis

---

## 📈 Key Funnel Metrics

| Metric | Value |
|---|---|
| Total Visitors | 5000 |
| Total Buyers | 826 |
| Overall Conversion Rate | ~17% |
| Cart to Checkout Conversion | ~71% |
| Checkout to Payment Conversion | ~82% |
| Payment to Purchase Conversion | ~92% |
| Average Order Value | ~$115 |
| Revenue per Visitor | ~$17.6 |

---

## 🔍 Key Insights

### 1. Largest Drop-Off Occurs Before Cart Stage

A significant number of users viewed products but did not proceed to add items to cart.

Possible reasons:
- Weak product descriptions
- Lack of trust/reviews
- Pricing concerns
- Poor CTA placement
- Low-intent traffic

This indicates that improving the product discovery and product page experience could significantly increase conversions.

---

### 2. Checkout Flow Performs Strongly

Users who reached checkout showed high conversion rates through payment and purchase stages (~80%+).

This indicates:
- Smooth checkout UX
- Minimal payment friction
- Strong buyer intent
- Reliable purchase flow

The checkout system appears optimized and does not require major redesign changes.

---

### 3. Strong Purchase Completion Rate

The payment-to-purchase conversion rate (~92%) indicates that once users reach payment stage, most successfully complete purchases.

This suggests:
- Reliable payment gateway
- Effective checkout design
- Low transactional friction
- High user confidence during payment

---

### 4. Email Outperforms Social Media Significantly

Email marketing drives a ~13%+ conversion rate compared to only ~6% for Social Media, despite Social generating ~30% of overall traffic volume.

This reveals:
- Social media attracts high-volume but low-intent "window shoppers"
- Email captures high-intent users who are far more likely to buy
- Budget allocation to social ads may not be delivering proportional returns

---

### 5. Healthy Revenue Metrics

The project identified:
- Strong average order value (~$115)
- Positive revenue per visitor
- Consistent purchase behavior

These metrics help evaluate overall customer monetization efficiency and business performance.

---

## 💡 Final Recommendations

### 1. UX & Website Optimization

#### ✅ Don't Touch the Checkout Flow
The conversion rates from Checkout Start → Purchase are excellent (~80%+), indicating the technical payment flow is frictionless.

**Action:** Do not redesign the checkout page right now; you risk breaking something that is working perfectly.

---

### 2. Marketing Strategy

#### ✅ Stop Over-Investing in Social for Sales
Social Media is driving ~30% of traffic (Volume) but has the lowest conversion rate (Efficiency). The platform is likely paying for "window shoppers."

**Action:** Shift budget away from "Traffic" objectives on social ads and focus on "Retargeting" or "Lead Gen" to capture emails instead.

#### ✅ Double Down on Email Marketing
Email is the highest converting channel (~13%+ conversion rate vs ~6% for Social).

**Action:** Implement an aggressive email capture popup for high-volume Social visitors. If users can be moved onto the email list, the data proves they are far more likely to buy later.

---

### 3. Financial & Revenue

#### ✅ Audit Ad Spend Against AOV
The Average Order Value is ~$115.

**Action:** Set a strict Customer Acquisition Cost (CAC) limit. If more than $30–$40 is being paid to acquire a customer via Social Media ads (which convert poorly), those specific transactions are likely unprofitable.

---

## 🧠 SQL Concepts Used

- CTEs (`WITH`)
- CASE WHEN
- COUNT DISTINCT
- Aggregate Functions
- Conditional Aggregation
- Conversion Rate Calculations
- Revenue KPI Calculations
- TIMESTAMP Functions
- DATE Functions
- User Journey Analysis

---

## 📸 Screenshots

### 1. Funnel SQL Logic
File: `Funnel Creation.png`

### 2. Revenue KPI Results
File: `Revenue KPI.png`

### 3. Revenue KPI Query
File: `Revenue Query.png`

---

## 📁 Project Structure

```text
ecommerce-funnel-analysis/
│
├── README.md
├── funnel.sql
├── Funnel Creation.png
├── Revenue KPI.png
└── Revenue Query.png
```

---

## 🚀 Conclusion

This project demonstrates how SQL and BigQuery can be used to:
- Analyze customer behavior
- Measure funnel performance
- Calculate revenue KPIs
- Generate business insights
- Support data-driven decision making

The project combines technical SQL skills with analytical and business thinking relevant to Data Analyst roles.
