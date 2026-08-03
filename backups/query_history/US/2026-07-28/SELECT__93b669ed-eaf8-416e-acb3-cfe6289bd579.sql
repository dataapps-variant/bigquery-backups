-- job_id: 93b669ed-eaf8-416e-acb3-cfe6289bd579
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T06:04:50.621000+00:00
-- started: 2026-07-28T06:04:50.733000+00:00
-- ended: 2026-07-28T06:04:50.950000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
