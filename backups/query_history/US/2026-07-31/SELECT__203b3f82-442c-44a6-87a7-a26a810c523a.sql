-- job_id: 203b3f82-442c-44a6-87a7-a26a810c523a
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T08:04:47.722000+00:00
-- started: 2026-07-31T08:04:47.861000+00:00
-- ended: 2026-07-31T08:04:48+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
