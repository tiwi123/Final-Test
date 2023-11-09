-- NOMOR 2
-- Mengisi Tabel Dimensi User
INSERT INTO dim_user (user_id, user_name, country)
SELECT DISTINCT user_id, user_name, country FROM raw_users;

-- Mengisi Tabel Dimensi Post
INSERT INTO dim_post (post_id, post_text, post_date, user_id)
SELECT DISTINCT rp.post_id, rp.post_text, rp.post_date, rp.user_id
FROM raw_posts rp
JOIN dim_user du ON rp.user_id = du.user_id;

-- Mengisi Tabel Dimensi Date
INSERT INTO dim_date (date_id)
SELECT DISTINCT post_date FROM raw_posts;

-- NOMOR 3
-- Membuat Tabel Fakta Post Performance
CREATE TABLE fact_post_performance (
  post_id INT REFERENCES dim_post(post_id),
  date_id DATE REFERENCES dim_date(date_id),
  post_views INT,
  post_likes INT
);
