-- job_id: 5946faf2-e576-4e7a-8d0c-03b2a466e55b
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:03:17.327000+00:00
-- started: 2026-08-03T11:03:17.433000+00:00
-- ended: 2026-08-03T11:03:17.529000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
