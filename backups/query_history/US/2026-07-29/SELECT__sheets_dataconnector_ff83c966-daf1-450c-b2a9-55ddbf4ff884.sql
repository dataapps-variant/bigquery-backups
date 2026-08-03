-- job_id: sheets_dataconnector_ff83c966-daf1-450c-b2a9-55ddbf4ff884
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T17:39:11.331000+00:00
-- started: 2026-07-29T17:39:11.412000+00:00
-- ended: 2026-07-29T17:39:11.698000+00:00

 SELECT 
ARRAY( SELECT AS STRUCT COUNT(UPPER(NULLIF(`Channel_name`, ''))) as `non_empty_count`, COUNT(DISTINCT UPPER(NULLIF(`Channel_name`, ''))) as `total_unique_count`, COUNT(*) as `total_count`
  FROM (
SELECT * FROM `variant-finance-data-project.Ad_spend_data.Spend_Matching_Channel`
) AS `baseQuery`
) AS `single_values_insights_array`, 
ARRAY( SELECT AS STRUCT MAX(`Channel_name`) as `Channel_name`, COUNT(`Channel_name`) as `most_frequent_values`
  FROM (
SELECT * FROM `variant-finance-data-project.Ad_spend_data.Spend_Matching_Channel`
) AS `baseQuery`

 GROUP BY UPPER(`Channel_name`)
 ORDER BY most_frequent_values DESC 
 LIMIT 500
) AS `most_frequent_values_array`
