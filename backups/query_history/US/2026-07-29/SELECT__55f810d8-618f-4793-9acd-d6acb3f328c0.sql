-- job_id: 55f810d8-618f-4793-9acd-d6acb3f328c0
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T20:06:14.481000+00:00
-- started: 2026-07-29T20:06:14.568000+00:00
-- ended: 2026-07-29T20:06:14.694000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
