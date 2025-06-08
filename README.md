<p align="center">
  <img src="assets/netflix-logo.png" width="300" alt="Netflix Logo">
</p>

# 🎬 Netflix Data Analysis (SQL Project)

📊 **SQL Case Study | Content Trends | Business Insights | PostgreSQL**

---

## 🔍 Project Overview

This project uses **PostgreSQL** to analyze Netflix's content catalog and answer key business questions such as:
- What genres dominate the platform?
- Which countries contribute the most content?
- Who are the top actors or directors in specific regions?
- How does content vary by release year and type?

This project demonstrates SQL querying, string parsing, filtering, subqueries, CTEs, window functions, and business insight extraction from semi-structured data.

---

## 🧮 Dataset Overview

The dataset (`netflix_titles.csv`) includes:
- `show_id`, `title`, `type`, `director`, `casts`
- `country`, `release_year`, `rating`, `duration`
- `listed_in` (genres), `description`, `date_added`

---

## 💼 Key Business Questions Solved

### 🔹 Content Type & Ratings
- 📌 Count number of **Movies vs TV Shows**
- 📌 Find the **most common rating** per content type

### 🔹 Time & Country Trends
- 📌 List **movies released in a specific year**
- 📌 Top 5 **content-producing countries**
- 📌 Analyze **content added in the last 5 years**
- 📌 Average content releases in **France by year**

### 🔹 Directors, Casts, and Genres
- 📌 List all content by **Rajiv Chilaka**
- 📌 Find **longest movie** by runtime
- 📌 Count **content per genre**
- 📌 Identify **content without a director**

### 🔹 Actor Focused
- 📌 Count movies **Salman Khan** appeared in (last 10 years)
- 📌 Top 10 **actors in French movies**

### 🔹 Classification Use Case
- 📌 Categorize content as **Good/Bad** based on keywords like `'kill'` or `'violence'`

---

## 💡 Sample Query

```sql
-- Find top 5 content-producing countries
WITH splited_countries AS (
	SELECT unnest(string_to_array(country, ', ')) AS country
	FROM netflix
	WHERE country IS NOT NULL
)
SELECT country, COUNT(*) AS content
FROM splited_countries
GROUP BY country
ORDER BY content DESC
LIMIT 5;
🧠 Insights Gained
TV Shows slightly outnumber Movies on Netflix

TV-MA is the most common rating across all content

The United States, India, and the UK produce the most content

Documentaries and Dramas are dominant genres

Actor Salman Khan appears in multiple titles over the last decade

Netflix has significantly expanded French content in recent years

⚙️ Tools & Tech Used
PostgreSQL – Querying & analysis

pgAdmin – SQL IDE

Git & GitHub – Version control & portfolio publishing

🖼️ Database Schema
<p align="center"> <img src="schema/schema.png" alt="Database Schema" width="800"> </p>
📥 How to Use
1️⃣ Clone this repo or download the .sql and .csv files
2️⃣ Create the schema using the provided SQL structure
3️⃣ Import the CSV into the netflix table
4️⃣ Run analysis queries inside any PostgreSQL IDE (e.g., pgAdmin)

👨‍💻 About Me
Hi, I'm Shareef Ali, a passionate Data Analyst with experience in SQL, Power BI, Python, and Excel.

📬 Let’s connect!
🔗 GitHub
🔗 LinkedIn
🔗 Portfolio Website

📢 If this project helped you, please ⭐ the repo!

markdown
Copy
Edit

---

### ✅ What You Need to Do

1. Replace `netflix-logo.png` with the one you used
2. Save the schema diagram as `schema/schema.png`
3. Push `Business Problems Netflix.sql` and `netflix_titles.csv`
4. Save this as your `README.md`

Once it's live, you’ll have an **excellent SQL portfolio piece** that balances business logic with clean query work.

Let me know when it’s uploaded or if you want to build a **dashboard (Power BI or Excel)** later for the sam