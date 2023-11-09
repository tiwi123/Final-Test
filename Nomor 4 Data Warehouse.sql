-- NOMOR 4
INSERT INTO fact_post_performance (post_id, date_id, post_views, post_likes)
SELECT 
    rp.post_id,
    rp.post_date,
    COUNT(DISTINCT rp.post_id) AS post_views,
    COUNT(rl.like_id) AS post_likes
FROM 
    raw_posts rp
LEFT JOIN 
    raw_likes rl ON rp.post_id = rl.post_id
GROUP BY 
    rp.post_id, rp.post_date;