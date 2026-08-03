-- job_id: 7da242e6-6413-4a8d-b638-5a62825fe60e
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T01:09:24.719000+00:00
-- started: 2026-08-03T01:09:24.825000+00:00
-- ended: 2026-08-03T01:09:24.939000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
