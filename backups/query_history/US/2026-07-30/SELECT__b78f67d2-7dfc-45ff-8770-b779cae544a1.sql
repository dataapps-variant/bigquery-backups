-- job_id: b78f67d2-7dfc-45ff-8770-b779cae544a1
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T14:04:26.428000+00:00
-- started: 2026-07-30T14:04:26.539000+00:00
-- ended: 2026-07-30T14:04:26.654000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
