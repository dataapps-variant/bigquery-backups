-- job_id: 6909159a-72df-4443-8699-766c0dea896a
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T04:07:39.340000+00:00
-- started: 2026-07-29T04:07:39.499000+00:00
-- ended: 2026-07-29T04:07:39.644000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
