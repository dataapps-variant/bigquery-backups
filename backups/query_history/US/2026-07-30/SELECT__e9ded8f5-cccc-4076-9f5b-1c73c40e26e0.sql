-- job_id: e9ded8f5-cccc-4076-9f5b-1c73c40e26e0
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T05:04:37.188000+00:00
-- started: 2026-07-30T05:04:37.318000+00:00
-- ended: 2026-07-30T05:04:37.446000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
