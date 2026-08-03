-- job_id: 34798e3f-b1d1-45cc-bbdb-34ace1033363
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:01:53.494000+00:00
-- started: 2026-08-03T12:01:53.596000+00:00
-- ended: 2026-08-03T12:01:53.765000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
