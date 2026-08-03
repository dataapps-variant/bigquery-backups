-- job_id: 71e946df-51bc-45f3-af2f-cea1588d3274
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T23:01:22.434000+00:00
-- started: 2026-07-28T23:01:22.579000+00:00
-- ended: 2026-07-28T23:01:22.714000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
