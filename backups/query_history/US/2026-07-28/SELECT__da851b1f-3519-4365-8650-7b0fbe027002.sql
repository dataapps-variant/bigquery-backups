-- job_id: da851b1f-3519-4365-8650-7b0fbe027002
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T23:02:42.937000+00:00
-- started: 2026-07-28T23:02:43.104000+00:00
-- ended: 2026-07-28T23:02:43.233000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
