-- job_id: c539aa1a-628b-4626-9c83-fb8b69294d8f
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T21:05:57.357000+00:00
-- started: 2026-07-31T21:05:57.556000+00:00
-- ended: 2026-07-31T21:05:57.751000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
