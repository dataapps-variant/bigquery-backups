-- job_id: b0a180dd-b778-4ea1-83dc-5e7792141895
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T13:01:46.987000+00:00
-- started: 2026-08-01T13:01:47.105000+00:00
-- ended: 2026-08-01T13:01:47.251000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'brainable' AND order_id IS NOT NULL
