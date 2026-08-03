-- job_id: 58eedf22-1faa-4824-8cd2-ae8e7263a4b6
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-27T16:03:24.346000+00:00
-- started: 2026-07-27T16:03:24.484000+00:00
-- ended: 2026-07-27T16:03:24.621000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
