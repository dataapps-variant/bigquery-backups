-- job_id: 09fb3392-3c6e-4706-828d-6aa1aaece39f
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T20:07:39.211000+00:00
-- started: 2026-07-30T20:07:39.301000+00:00
-- ended: 2026-07-30T20:07:39.427000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
