-- job_id: 3124d792-cc03-463a-b723-973d86e4fe4e
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T16:07:48.102000+00:00
-- started: 2026-08-01T16:07:48.225000+00:00
-- ended: 2026-08-01T16:07:48.327000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'brainable' AND order_id IS NOT NULL
