-- job_id: 0b3188a2-395c-4ad7-804f-c5ccbe3b54d0
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T19:08:05.020000+00:00
-- started: 2026-07-28T19:08:05.120000+00:00
-- ended: 2026-07-28T19:08:05.235000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
