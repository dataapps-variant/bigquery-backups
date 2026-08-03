-- job_id: 08307f70-9314-4d6e-b989-8ad0b7e058eb
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T19:04:12.362000+00:00
-- started: 2026-07-31T19:04:12.508000+00:00
-- ended: 2026-07-31T19:04:12.645000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
