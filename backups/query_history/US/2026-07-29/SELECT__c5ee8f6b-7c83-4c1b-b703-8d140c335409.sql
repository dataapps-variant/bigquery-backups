-- job_id: c5ee8f6b-7c83-4c1b-b703-8d140c335409
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T12:03:44.840000+00:00
-- started: 2026-07-29T12:03:44.944000+00:00
-- ended: 2026-07-29T12:03:45.059000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
