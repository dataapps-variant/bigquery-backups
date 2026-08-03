-- job_id: 17bdc0fe-5a01-4e0f-92ca-6fa7f5b3b70b
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T19:07:29.938000+00:00
-- started: 2026-07-30T19:07:30.060000+00:00
-- ended: 2026-07-30T19:07:30.196000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
