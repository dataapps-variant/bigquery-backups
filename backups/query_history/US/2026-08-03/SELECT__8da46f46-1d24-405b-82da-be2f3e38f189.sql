-- job_id: 8da46f46-1d24-405b-82da-be2f3e38f189
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T03:03:05.147000+00:00
-- started: 2026-08-03T03:03:05.317000+00:00
-- ended: 2026-08-03T03:03:05.435000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
