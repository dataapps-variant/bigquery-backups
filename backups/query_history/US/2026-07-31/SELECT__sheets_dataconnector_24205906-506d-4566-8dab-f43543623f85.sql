-- job_id: sheets_dataconnector_24205906-506d-4566-8dab-f43543623f85
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T13:55:57.734000+00:00
-- started: 2026-07-31T13:55:57.825000+00:00
-- ended: 2026-07-31T13:55:57.931000+00:00

  SELECT `order_date` AS `order_date`, `total` AS `total`, `success` AS `success`, `declined` AS `declined`, `t7d_total` AS `t7d_total`, `t7d_success` AS `t7d_success`, `t7d_approval_rate` AS `t7d_approval_rate`, `is_lowest` AS `is_lowest`, `is_highest` AS `is_highest`, `order_outcome` AS `order_outcome`, `decline_reason_category` AS `decline_reason_category`, `fault_category` AS `fault_category`, `order_count` AS `order_count`, `pct_of_declined` AS `pct_of_declined`
  FROM (
SELECT * FROM `variant-finance-data-project.Utilities.MIT_Approval_Rate_summary`
)
  ORDER BY `order_date` DESC
  LIMIT 500
