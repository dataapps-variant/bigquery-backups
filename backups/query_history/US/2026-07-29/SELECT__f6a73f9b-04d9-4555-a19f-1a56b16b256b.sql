-- job_id: f6a73f9b-04d9-4555-a19f-1a56b16b256b
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T16:02:55.619000+00:00
-- started: 2026-07-29T16:02:55.842000+00:00
-- ended: 2026-07-29T16:02:56.005000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
