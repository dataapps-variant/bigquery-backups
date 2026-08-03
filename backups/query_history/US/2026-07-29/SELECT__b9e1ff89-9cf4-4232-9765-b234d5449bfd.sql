-- job_id: b9e1ff89-9cf4-4232-9765-b234d5449bfd
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T06:06:15.390000+00:00
-- started: 2026-07-29T06:06:15.488000+00:00
-- ended: 2026-07-29T06:06:15.598000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
