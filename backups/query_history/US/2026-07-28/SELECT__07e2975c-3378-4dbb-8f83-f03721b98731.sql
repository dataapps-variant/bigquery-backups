-- job_id: 07e2975c-3378-4dbb-8f83-f03721b98731
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T07:07:04.450000+00:00
-- started: 2026-07-28T07:07:04.579000+00:00
-- ended: 2026-07-28T07:07:04.907000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
