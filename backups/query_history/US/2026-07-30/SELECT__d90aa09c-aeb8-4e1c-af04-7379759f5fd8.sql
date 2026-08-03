-- job_id: d90aa09c-aeb8-4e1c-af04-7379759f5fd8
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T15:04:14.357000+00:00
-- started: 2026-07-30T15:04:14.469000+00:00
-- ended: 2026-07-30T15:04:14.641000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
