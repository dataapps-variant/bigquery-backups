-- job_id: c0a2933d-a788-44fd-a1f1-b01f88180ee8
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T15:04:57.334000+00:00
-- started: 2026-07-29T15:04:57.501000+00:00
-- ended: 2026-07-29T15:04:57.615000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
