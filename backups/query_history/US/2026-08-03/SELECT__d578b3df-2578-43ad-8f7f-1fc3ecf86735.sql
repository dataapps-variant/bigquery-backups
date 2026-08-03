-- job_id: d578b3df-2578-43ad-8f7f-1fc3ecf86735
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T05:03:09.818000+00:00
-- started: 2026-08-03T05:03:10.043000+00:00
-- ended: 2026-08-03T05:03:10.277000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'brainable' AND order_id IS NOT NULL
