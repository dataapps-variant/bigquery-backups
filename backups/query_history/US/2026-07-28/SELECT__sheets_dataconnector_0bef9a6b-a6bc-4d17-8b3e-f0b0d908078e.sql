-- job_id: sheets_dataconnector_0bef9a6b-a6bc-4d17-8b3e-f0b0d908078e
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T17:00:58.180000+00:00
-- started: 2026-07-28T17:00:58.254000+00:00
-- ended: 2026-07-28T17:00:58.710000+00:00

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
