-- job_id: a3c2017b-d6d6-4d1f-b0eb-b19ff373b7e4
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T21:04:03.515000+00:00
-- started: 2026-08-01T21:04:03.620000+00:00
-- ended: 2026-08-01T21:04:03.729000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
