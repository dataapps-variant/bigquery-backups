-- job_id: 75be0b28-6a7d-4a15-86e8-23c92d2f4384
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T06:04:31.129000+00:00
-- started: 2026-07-31T06:04:31.334000+00:00
-- ended: 2026-07-31T06:04:31.457000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
