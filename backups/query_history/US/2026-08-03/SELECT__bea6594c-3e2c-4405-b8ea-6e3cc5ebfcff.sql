-- job_id: bea6594c-3e2c-4405-b8ea-6e3cc5ebfcff
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T06:05:09.380000+00:00
-- started: 2026-08-03T06:05:09.505000+00:00
-- ended: 2026-08-03T06:05:09.600000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
