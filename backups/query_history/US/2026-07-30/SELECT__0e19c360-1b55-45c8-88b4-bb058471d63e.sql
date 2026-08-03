-- job_id: 0e19c360-1b55-45c8-88b4-bb058471d63e
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T06:07:32.980000+00:00
-- started: 2026-07-30T06:07:33.442000+00:00
-- ended: 2026-07-30T06:07:33.553000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
