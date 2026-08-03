-- job_id: cc2bb71a-5683-40e2-9849-ee9f30d8fbbd
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T06:02:36.707000+00:00
-- started: 2026-08-01T06:02:36.843000+00:00
-- ended: 2026-08-01T06:02:36.965000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
