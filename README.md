<p align="center">
  <img src="https://upload.wikimedia.org/wikipedia/commons/6/69/Netflix_logo.svg" width="200" alt="Netflix Logo">
</p>

<h1 align="center">Netflix Data Analysis Project 🎬</h1>
<p align="center">
  An in-depth SQL analysis of Netflix's content library, revealing key insights about Movies, TV Shows, Genres, Ratings, and more. 
</p>

---

## 📊 Project Overview

This project uses **SQL (PostgreSQL)** to analyze a Netflix dataset, uncovering valuable insights to support business decisions. It includes:
- Counting Movies vs TV Shows
- Identifying popular genres and ratings
- Analyzing content release trends in different countries
- Discovering top actors and long-running TV Shows
- Categorizing content based on keywords

This project not only demonstrates proficiency in SQL but also showcases the ability to solve real-world business problems using data-driven insights.

---

## 🚀 Features and Business Problems Solved

1. **Count the number of Movies vs TV Shows**  
   *Business Need:* Understand content distribution on Netflix.  
   *Solution:* Grouped by type and counted occurrences.

2. **Find the most common rating for Movies and TV Shows**  
   *Business Need:* Identify the target audience's preferred ratings.  
   *Solution:* Counted ratings, grouped by type, and selected the most frequent.

3. **List all movies released in a specific year**  
   *Business Need:* Analyze movie releases by year for trend analysis.  
   *Solution:* Filtered by type and release year.

4. **Top 5 countries with the most content**  
   *Business Need:* Identify content-producing countries for strategic expansion.  
   *Solution:* Split and counted occurrences of countries listed.

5. **Identify the longest movie**  
   *Business Need:* Discover unique content offerings.  
   *Solution:* Converted duration to integer and sorted by descending order.

6. **Find content added in the last 5 years**  
   *Business Need:* Analyze recent content trends.  
   *Solution:* Extracted year from date and filtered by the last 5 years.

7. **List all movies/TV shows by director 'Rajiv Chilaka'**  
   *Business Need:* Discover works by a specific creator.  
   *Solution:* Searched for the director's name using LIKE.

8. **List all TV shows with more than 5 seasons**  
   *Business Need:* Identify long-running, popular TV shows.  
   *Solution:* Extracted and filtered by season count.

9. **Count content items in each genre**  
   *Business Need:* Measure genre popularity.  
   *Solution:* Split and counted each genre occurrence.

10. **Average content release in France by year**  
   *Business Need:* Analyze Netflix's growth in France.  
   *Solution:* Counted and averaged content per year.

11. **List all movies that are documentaries**  
   *Business Need:* Identify educational and factual content.  
   *Solution:* Filtered by 'Documentaries' in listed_in.

12. **Find all content without a director**  
   *Business Need:* Complete metadata analysis.  
   *Solution:* Checked for NULL or empty values.

13. **Find how many movies Salman Khan appeared in last 10 years**  
   *Business Need:* Measure popularity of a specific actor.  
   *Solution:* Filtered by actor name and release year.

14. **Top 10 actors in French movies**  
   *Business Need:* Identify influential actors in a specific market.  
   *Solution:* Split casts, counted, and sorted.

15. **Categorize content as 'Bad' or 'Good' based on keywords**  
   *Business Need:* Content moderation and audience targeting.  
   *Solution:* Used CASE to label content and counted each category.

---

## ⚙️ Technologies Used

- **SQL (PostgreSQL)** – For data querying and analysis.
- **pgAdmin** – To write and execute SQL queries.
- **Git & GitHub** – Version control and project showcase.

---

## 📂 Dataset

The dataset used in this project includes:
- **Title** – Name of the content.
- **Type** – Movie or TV Show.
- **Director** – Director's name.
- **Casts** – Main actors.
- **Country** – Country of production.
- **Date Added** – Date content was added to Netflix.
- **Release Year** – Year the content was released.
- **Rating** – Age rating (e.g., PG-13, TV-MA).
- **Duration** – Movie length or TV Show seasons.
- **Listed In** – Genres (e.g., Dramas, Comedies).
- **Description** – Short description of the content.

---

## 💻 How to Run the Project

1. **Clone the repository:**
   ```sh
   git clone https://github.com/your-username/netflix-data-analysis.git
   cd netflix-data-analysis
