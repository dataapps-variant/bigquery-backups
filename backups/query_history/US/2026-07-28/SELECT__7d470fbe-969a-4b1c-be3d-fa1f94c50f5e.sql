-- job_id: 7d470fbe-969a-4b1c-be3d-fa1f94c50f5e
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T19:07:22.551000+00:00
-- started: 2026-07-28T19:07:22.652000+00:00
-- ended: 2026-07-28T19:07:22.780000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
