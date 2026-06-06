-- =========================================
-- MUSIC STREAMING DATA ANALYSIS PROJECT
-- =========================================

-- This project analyzes user behavior and churn patterns
-- in a music streaming platform using SQL.

-- =========================================
-- 1. TABLE CREATION
-- =========================================
CREATE TABLE music_streaming (
    user_id TEXT,
    age INTEGER,
    country TEXT,
    subscription_type TEXT,
    device TEXT,
    daily_minutes INTEGER,
    favorite_genre TEXT,
    skip_rate REAL,
    ads_clicked INTEGER,
    churned INTEGER
);

-- =========================================
-- 2. DATA INSERTION
-- =========================================

-- Example record insertion (user behavior data)

INSERT INTO music_streaming (
    user_id, age, country, subscription_type, device,
    daily_minutes, favorite_genre, skip_rate, ads_clicked, churned
)
VALUES (
    'U001', 22, 'TR', 'free', 'mobile',
    45, 'pop', 0.35, 1, 0
);

-- =========================================
-- 3. BASIC QUERIES
-- =========================================

-- Retrieve all data
SELECT *
FROM music_streaming;

-- Select key features
SELECT user_id, country, subscription_type, daily_minutes
FROM music_streaming;

-- Filter premium users
SELECT *
FROM music_streaming
WHERE subscription_type = 'premium';

-- Users with high engagement
SELECT *
FROM music_streaming
WHERE daily_minutes > 100;

-- Top 10 most active users
SELECT *
FROM music_streaming
ORDER BY daily_minutes DESC
LIMIT 10;

-- =========================================
-- 4. AGGREGATION QUERIES
-- =========================================

-- Total number of users
SELECT COUNT(*) AS total_users
FROM music_streaming;

-- Total listening time
SELECT SUM(daily_minutes) AS total_daily_minutes
FROM music_streaming;

-- Average listening time
SELECT AVG(daily_minutes) AS avg_daily_minutes
FROM music_streaming;


-- =========================================
-- 5. GROUP BY ANALYSIS
-- =========================================

-- Subscription type analysis
SELECT
    subscription_type,
    COUNT(*) AS user_count,
    SUM(daily_minutes) AS total_daily_minutes,
    AVG(daily_minutes) AS avg_daily_minutes
FROM music_streaming
GROUP BY subscription_type;

-- Churn behavior analysis
SELECT
    churned,
    COUNT(*) AS user_count,
    AVG(daily_minutes) AS avg_daily_minutes,
    AVG(skip_rate) AS avg_skip_rate
FROM music_streaming
GROUP BY churned;

-- Country-based engagement analysis
SELECT
    country,
    COUNT(*) AS user_count,
    AVG(daily_minutes) AS avg_daily_minutes
FROM music_streaming
GROUP BY country
ORDER BY avg_daily_minutes DESC;

-- Device usage analysis
SELECT
    device,
    COUNT(*) AS user_count,
    AVG(daily_minutes) AS avg_daily_minutes,
    AVG(skip_rate) AS avg_skip_rate
FROM music_streaming
GROUP BY device;

-- Favorite genre analysis
SELECT
    favorite_genre,
    COUNT(*) AS user_count,
    AVG(daily_minutes) AS avg_daily_minutes,
    AVG(skip_rate) AS avg_skip_rate
FROM music_streaming
GROUP BY favorite_genre
ORDER BY avg_skip_rate DESC;

-- =========================================
-- 6. DATA QUALITY CHECKS
-- =========================================

-- Check missing skip_rate values
SELECT *
FROM music_streaming
WHERE skip_rate IS NULL;
