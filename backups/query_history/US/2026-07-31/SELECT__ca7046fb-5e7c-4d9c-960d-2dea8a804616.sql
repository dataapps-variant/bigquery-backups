-- job_id: ca7046fb-5e7c-4d9c-960d-2dea8a804616
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T03:01:34.283000+00:00
-- started: 2026-07-31T03:01:34.403000+00:00
-- ended: 2026-07-31T03:01:34.519000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
