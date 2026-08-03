-- job_id: 5280eb02-ee9a-4da7-8b89-fb5c87967b0c
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T02:07:44.522000+00:00
-- started: 2026-08-01T02:07:44.641000+00:00
-- ended: 2026-08-01T02:07:44.756000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
