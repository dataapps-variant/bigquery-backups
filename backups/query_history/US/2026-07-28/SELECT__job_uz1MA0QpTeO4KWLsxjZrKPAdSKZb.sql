-- job_id: job_uz1MA0QpTeO4KWLsxjZrKPAdSKZb
-- user: apache-superset-admin@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T09:52:03.788000+00:00
-- started: 2026-07-28T09:52:03.905000+00:00
-- ended: 2026-07-28T09:52:04.145000+00:00

SELECT `Billing_Cycle` AS `Billing_Cycle` 
FROM `VPU_Merged`.`15K_Main_Table_30` GROUP BY `Billing_Cycle` ORDER BY `Billing_Cycle` ASC
 LIMIT 1000
