-- job_id: 3f9242cc-1549-4665-8e4b-52ffe46849dc
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T23:04:06.371000+00:00
-- started: 2026-07-31T23:04:06.476000+00:00
-- ended: 2026-07-31T23:04:06.579000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
