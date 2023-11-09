-- NOMOR 5
-- Membuat Tabel Fakta Daily Posts
CREATE TABLE fact_daily_posts (
  user_id INT REFERENCES dim_user(user_id),
  date_id DATE REFERENCES dim_date(date_id),
  daily_posts INT
);

-- NOMOR 6
-- Mengisi Tabel Fakta Daily Posts
INSERT INTO fact_daily_posts (user_id, date_id, daily_posts)
SELECT 
    rp.user_id,
    rp.post_date,
    COUNT(rp.post_id) AS daily_posts
FROM 
    raw_posts rp
GROUP BY 
    rp.user_id, rp.post_date;