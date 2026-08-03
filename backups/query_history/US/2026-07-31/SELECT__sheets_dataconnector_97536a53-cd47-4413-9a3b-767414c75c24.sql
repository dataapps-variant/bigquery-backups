-- job_id: sheets_dataconnector_97536a53-cd47-4413-9a3b-767414c75c24
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T13:36:03.411000+00:00
-- started: 2026-07-31T13:36:03.478000+00:00
-- ended: 2026-07-31T13:36:03.669000+00:00

  SELECT `order_date` AS `order_date`, `total` AS `total`, `success` AS `success`, `declined` AS `declined`, `t7d_total` AS `t7d_total`, `t7d_success` AS `t7d_success`, `t7d_approval_rate` AS `t7d_approval_rate`, `is_lowest` AS `is_lowest`, `is_highest` AS `is_highest`, `order_outcome` AS `order_outcome`, `decline_reason_category` AS `decline_reason_category`, `fault_category` AS `fault_category`, `order_count` AS `order_count`, `pct_of_declined` AS `pct_of_declined`
  FROM (
SELECT * FROM `variant-finance-data-project.Utilities.MIT_Approval_Rate_summary`
)
  ORDER BY `order_date` DESC
  LIMIT 500
