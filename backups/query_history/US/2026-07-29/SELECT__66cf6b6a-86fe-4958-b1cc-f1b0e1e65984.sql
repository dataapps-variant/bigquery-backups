-- job_id: 66cf6b6a-86fe-4958-b1cc-f1b0e1e65984
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T11:02:17.646000+00:00
-- started: 2026-07-29T11:02:17.750000+00:00
-- ended: 2026-07-29T11:02:17.870000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
