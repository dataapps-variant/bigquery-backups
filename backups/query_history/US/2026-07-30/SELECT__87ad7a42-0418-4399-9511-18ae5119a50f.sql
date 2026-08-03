-- job_id: 87ad7a42-0418-4399-9511-18ae5119a50f
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T06:08:23.655000+00:00
-- started: 2026-07-30T06:08:23.793000+00:00
-- ended: 2026-07-30T06:08:24.082000+00:00


           SELECT DISTINCT order_id, last_modified 
           FROM `variant-finance-data-project.Sticky_Data.missing_updated_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
