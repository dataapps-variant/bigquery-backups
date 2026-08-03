-- job_id: 23279e0e-08c3-4743-ac02-d5cdc2982ddd
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T08:06:30.386000+00:00
-- started: 2026-07-28T08:06:30.508000+00:00
-- ended: 2026-07-28T08:06:30.636000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
