# Olympic-Data-Analysis-Using-MySQL

# 🏅 **Olympic Data Analysis Using MySQL**

## 📋 **Project Overview**
This project explores Olympic data using MySQL, focusing on medal counts, sports statistics, and country-specific insights. The dataset includes athlete details, sports information, and medal achievements.

---

## 📂 **Database Structure**
- **Database Name:** `proje2024`
- **Table Name:** `olympics`

### **Table Schema:**
| Column   | Data Type    | Description                  |
|-----------|---------------|--------------------------------|
| `ID`         | `INT`                | Athlete's unique identifier       |
| `Name`     | `VARCHAR(500)` | Athlete's name                    |
| `Sex`          | `VARCHAR(10)`       | Athlete's gender                     |
| `Age`          | `INT`                | Athlete's age                          |
| `Height`     | `INT`                | Athlete's height (cm)              |
| `Weight`    | `INT`                | Athlete's weight (kg)               |
| `Team`       | `VARCHAR(500)` | Athlete's team/country            |
| `NOC`         | `VARCHAR(300)`  | National Olympic Committee code |
| `Games`     | `VARCHAR(1000)` | Year and season of the game     |
| `Year`         | `INT`                | Year of the Olympic event           |
| `Season`   | `VARCHAR(500)` | Olympic season (Summer/Winter)  |
| `City`           | `VARCHAR(300)`  | Host city of the Olympic games     |
| `Sport`       | `VARCHAR(500)` | Sport category                      |
| `Event`       | `VARCHAR(2000)` | Specific event in the sport            |
| `Medal`      | `VARCHAR(500)` | Medal type (Gold/Silver/Bronze)   |

---

## ⚙️ **Key Features & Queries**
1. **Total Medal Count Analysis**
   ```sql
   SELECT COUNT(*) AS total_medals
   FROM olympics
   WHERE medal <> 'nonmedal';
   ```

2. **Count of Unique Sports**
   ```sql
   SELECT DISTINCT(sport), COUNT(*) AS sport_count
   FROM olympics
   GROUP BY sport;
   ```

3. **Medal Analysis for Team India**
   ```sql
   SELECT Team, medal, COUNT(medal) AS countmedal
   FROM olympics
   WHERE Team = 'India' AND medal <> 'Nomedal'
   GROUP BY medal, Team;
   ```

4. **Athletes Winning Multiple Medals**
   ```sql
   SELECT Name, COUNT(medal) AS total_medals
   FROM olympics
   WHERE medal <> 'Nomedal'
   GROUP BY Name
   HAVING total_medals > 1;
   ```

5. **Top Medal-Winning Countries**
   ```sql
   SELECT Team, COUNT(medal) AS total_medals
   FROM olympics
   WHERE medal <> 'Nomedal'
   GROUP BY Team
   ORDER BY total_medals DESC;
   ```

---

## 🚀 **How to Run the Project**
1. **Import Database:**
   - Create the database using:
     ```sql
     CREATE DATABASE proje2024;
     USE proje2024;
     ```
2. **Load Data:**
   ```sql
   LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Athletes_Cleaned.csv'
   INTO TABLE olympics
   FIELDS TERMINATED BY ','
   ENCLOSED BY '"'
   LINES TERMINATED BY '\r\n'
   IGNORE 1 ROWS;
   ```
3. **Execute Queries:**
   - Use the provided SQL queries to extract insights from the data.

---

## 📊 **Insights Gained**
✅ Identified India's total medal count and key medal-winning sports.
✅ Highlighted top-performing countries in terms of medal counts.
✅ Showcased athletes who won multiple medals, revealing outstanding performers.

---

## 🌟 **Technologies Used**
- **MySQL** for data querying and management
- **SQL Queries** for data extraction and insights generation






