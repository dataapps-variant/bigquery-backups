-- job_id: 7fca5fb9-f1e3-411f-97ff-fd5f830cd0f8
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T21:04:03.043000+00:00
-- started: 2026-07-28T21:04:03.214000+00:00
-- ended: 2026-07-28T21:04:03.340000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
