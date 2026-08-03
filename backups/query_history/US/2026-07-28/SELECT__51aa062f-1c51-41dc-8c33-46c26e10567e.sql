-- job_id: 51aa062f-1c51-41dc-8c33-46c26e10567e
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T15:02:43.419000+00:00
-- started: 2026-07-28T15:02:43.608000+00:00
-- ended: 2026-07-28T15:02:43.744000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'brainable' AND order_id IS NOT NULL
