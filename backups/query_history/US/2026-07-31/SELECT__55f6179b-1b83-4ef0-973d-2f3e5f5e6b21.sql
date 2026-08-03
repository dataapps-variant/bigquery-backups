-- job_id: 55f6179b-1b83-4ef0-973d-2f3e5f5e6b21
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T16:06:12.325000+00:00
-- started: 2026-07-31T16:06:12.483000+00:00
-- ended: 2026-07-31T16:06:12.582000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'brainable' AND order_id IS NOT NULL
