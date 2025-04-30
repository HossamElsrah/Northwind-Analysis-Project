# Northwind Data Analysis Project 📊

## 🌟 Overview
This comprehensive analysis of Northwind Traders (a fictional gourmet food distributor) explores sales performance, customer behavior, and operational efficiency across 1996-1998. Using SQL, Excel, and Power BI, I transformed raw data into actionable insights to drive business growth.

![Sales Dashboard](https://github.com/HossamElsrah/Northwind-Analysis-Project/blob/main/Power%20BI/Photos/Sales%20Overview.png)

## 🔧 Technologies Used
### **SQL Server**
- Performed data exploration and cleaning
- Created stored procedures for automated calculations
- Developed 17 key analytical queries including:
  ```sql
  -- Example: Top Customers by Sales
  SELECT TOP 10 c.CompanyName, SUM(od.UnitPrice*od.Quantity*(1-od.Discount)) AS TotalSales
  FROM Orders o
  JOIN [Order Details] od ON o.OrderID = od.OrderID
  JOIN Customers c ON o.CustomerID = c.CustomerID
  GROUP BY c.CompanyName
  ORDER BY TotalSales DESC
  ```

### **Excel Power Tools**
- **Power Query**: Cleaned and transformed data
- **Data Modeling**: Established relationships between tables  
  ![Data Model](https://github.com/HossamElsrah/Northwind-Analysis-Project/blob/main/Excel/Photos/Data%20Modeling.png)
- **Pivot Tables**: Created dynamic reports

### **Power BI**
- Built 4 interactive dashboards:
  1. **Sales Overview** - Revenue trends and KPIs
  2. **Customer Insights** - Top buyers and geographic distribution
  3. **Shipping Analysis** - Carrier performance metrics
  4. **Product Performance** - Category profitability

## 📊 Key Findings
### Sales Performance
- **1998 Q1** generated $276K (22% of total revenue)
- Top 3 customers (QUICK-Stop, Ernst Handel, Save-a-lot) contributed 31% of sales
- Beverages category had highest profitability ($82K)

### Operational Insights
- Average shipping time: 8 days
- 5.6% average discount rate
- Employee Margaret Peacock achieved highest sales ($232.9K)

## 🗂 Project Structure
```
Northwind-Analysis-Project/
├── SQL/                   # Exploration & analysis scripts
│   ├── Northwind_Exploration.sql
│   └── Northwind_create.sql
├── Excel/                 # Data modeling & reports
│   ├── Northwind_Analysis.xlsx
│   └── Photos/            # Data model diagrams
├── Power BI/              # Interactive dashboards
│   ├── Northwind_DashBoard.pbix
│   └── Photos/            # Dashboard screenshots
└── Reporting/             # Final analysis documents
    ├── North Wind Company Report.docx
    └── Analysis Qs.docx
```

## 🚀 How to Use
1. **SQL Analysis**:
   - Execute queries in SQL Server using the Northwind database
   - Stored procedures auto-calculate employee age/experience

2. **Power BI Dashboard**:
   ```powershell
   git lfs pull  # Ensure LFS files are downloaded
   Open Northwind_DashBoard.pbix
   ```

3. **Excel Reports**:
   - Refresh connections to update pivot tables

## 💡 Recommendations
1. Expand marketing to top customers (loyalty programs)
2. Optimize inventory for high-profit categories (Beverages/Dairy)
3. Analyze 1998 Q1 success factors for replication

## 👨💻 Connect
For more insights or collaboration opportunities:  
[Hossam Taha on LinkedIn](https://linkedin.com/in/hossam-taha-41b724288)
