-- job_id: 78ef39bf-9b1a-464b-b9a6-5fbd8b0167d8
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T01:07:02.984000+00:00
-- started: 2026-08-03T01:07:03.127000+00:00
-- ended: 2026-08-03T01:07:03.243000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
