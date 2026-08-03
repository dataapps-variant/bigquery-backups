-- job_id: 01648f83-3e7d-41a7-80a8-27f5c2baae43
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:03:04.122000+00:00
-- started: 2026-07-28T13:03:04.204000+00:00
-- ended: 2026-07-28T13:03:04.380000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
