-- job_id: e6dc4421-0e30-4985-9863-dfa424b23c05
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T13:04:16.823000+00:00
-- started: 2026-07-30T13:04:16.941000+00:00
-- ended: 2026-07-30T13:04:17.102000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
