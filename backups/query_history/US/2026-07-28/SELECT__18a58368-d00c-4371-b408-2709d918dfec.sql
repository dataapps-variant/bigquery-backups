-- job_id: 18a58368-d00c-4371-b408-2709d918dfec
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T04:04:34.459000+00:00
-- started: 2026-07-28T04:04:34.612000+00:00
-- ended: 2026-07-28T04:04:34.733000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
