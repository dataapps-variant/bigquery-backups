-- job_id: f16d9fa2-7ca8-4de7-a9b3-1d31044cb1f2
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T20:03:01.994000+00:00
-- started: 2026-08-02T20:03:02.105000+00:00
-- ended: 2026-08-02T20:03:02.210000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
