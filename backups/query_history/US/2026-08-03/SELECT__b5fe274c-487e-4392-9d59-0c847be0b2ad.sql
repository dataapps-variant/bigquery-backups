-- job_id: b5fe274c-487e-4392-9d59-0c847be0b2ad
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T07:03:30.032000+00:00
-- started: 2026-08-03T07:03:30.156000+00:00
-- ended: 2026-08-03T07:03:30.267000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
