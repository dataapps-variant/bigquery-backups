-- job_id: cc2a3336-7ee3-4078-bbf9-1ffe302eddcf
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-27T18:04:23.965000+00:00
-- started: 2026-07-27T18:04:24.138000+00:00
-- ended: 2026-07-27T18:04:24.275000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
