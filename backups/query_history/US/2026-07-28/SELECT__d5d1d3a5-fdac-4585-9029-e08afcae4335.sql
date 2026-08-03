-- job_id: d5d1d3a5-fdac-4585-9029-e08afcae4335
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T16:10:12.254000+00:00
-- started: 2026-07-28T16:10:12.370000+00:00
-- ended: 2026-07-28T16:10:12.475000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
