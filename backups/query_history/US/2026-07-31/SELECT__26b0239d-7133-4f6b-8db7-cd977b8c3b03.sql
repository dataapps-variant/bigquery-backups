-- job_id: 26b0239d-7133-4f6b-8db7-cd977b8c3b03
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T16:13:00.164000+00:00
-- started: 2026-07-31T16:13:00.292000+00:00
-- ended: 2026-07-31T16:13:00.412000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
