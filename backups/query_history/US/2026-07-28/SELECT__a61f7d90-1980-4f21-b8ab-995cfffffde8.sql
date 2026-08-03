-- job_id: a61f7d90-1980-4f21-b8ab-995cfffffde8
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T22:02:03.251000+00:00
-- started: 2026-07-28T22:02:03.384000+00:00
-- ended: 2026-07-28T22:02:03.507000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
