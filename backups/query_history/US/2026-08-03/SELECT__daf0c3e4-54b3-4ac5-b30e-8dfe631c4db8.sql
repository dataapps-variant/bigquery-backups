-- job_id: daf0c3e4-54b3-4ac5-b30e-8dfe631c4db8
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T00:01:33.249000+00:00
-- started: 2026-08-03T00:01:33.395000+00:00
-- ended: 2026-08-03T00:01:33.510000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
