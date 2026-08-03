-- job_id: sheets_dataconnector_4f62f465-5762-4794-b5f5-48a696cfee47
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T18:38:11.401000+00:00
-- started: 2026-07-30T18:38:11.497000+00:00
-- ended: 2026-07-30T18:38:11.786000+00:00

 SELECT 
ARRAY( SELECT AS STRUCT COUNT(UPPER(NULLIF(`decline_reason_category`, ''))) as `non_empty_count`, COUNT(DISTINCT UPPER(NULLIF(`decline_reason_category`, ''))) as `total_unique_count`, COUNT(*) as `total_count`
  FROM (
SELECT * FROM `variant-finance-data-project.Utilities.MIT_Approval_Rate_summary`
) AS `baseQuery`
) AS `single_values_insights_array`, 
ARRAY( SELECT AS STRUCT MAX(`decline_reason_category`) as `decline_reason_category`, COUNT(`decline_reason_category`) as `most_frequent_values`
  FROM (
SELECT * FROM `variant-finance-data-project.Utilities.MIT_Approval_Rate_summary`
) AS `baseQuery`

 GROUP BY UPPER(`decline_reason_category`)
 ORDER BY most_frequent_values DESC 
 LIMIT 500
) AS `most_frequent_values_array`
