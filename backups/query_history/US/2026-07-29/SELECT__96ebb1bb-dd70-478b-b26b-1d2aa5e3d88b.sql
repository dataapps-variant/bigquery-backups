-- job_id: 96ebb1bb-dd70-478b-b26b-1d2aa5e3d88b
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T07:09:15.572000+00:00
-- started: 2026-07-29T07:09:15.677000+00:00
-- ended: 2026-07-29T07:09:15.804000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
