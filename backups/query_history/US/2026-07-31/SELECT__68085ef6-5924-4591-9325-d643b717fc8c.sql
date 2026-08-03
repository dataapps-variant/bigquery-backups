-- job_id: 68085ef6-5924-4591-9325-d643b717fc8c
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T15:02:26.902000+00:00
-- started: 2026-07-31T15:02:27.059000+00:00
-- ended: 2026-07-31T15:02:27.193000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'brainable' AND order_id IS NOT NULL
