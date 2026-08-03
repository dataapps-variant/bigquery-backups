-- job_id: f0351b85-1b2b-4fd8-bdbe-8677b3115abe
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-27T18:01:24.439000+00:00
-- started: 2026-07-27T18:01:24.552000+00:00
-- ended: 2026-07-27T18:01:24.655000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
