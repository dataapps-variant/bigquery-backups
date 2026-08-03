-- job_id: d9c71fdf-37a1-4a7d-ba2b-13d1aaa143db
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T04:05:00.659000+00:00
-- started: 2026-07-28T04:05:00.752000+00:00
-- ended: 2026-07-28T04:05:00.884000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
