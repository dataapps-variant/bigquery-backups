-- job_id: f678367e-0bb1-402c-80f3-9a890f51b236
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T19:04:40.794000+00:00
-- started: 2026-08-01T19:04:40.945000+00:00
-- ended: 2026-08-01T19:04:41.046000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
