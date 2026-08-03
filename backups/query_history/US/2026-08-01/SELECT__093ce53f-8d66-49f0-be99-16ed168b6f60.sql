-- job_id: 093ce53f-8d66-49f0-be99-16ed168b6f60
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T21:01:11.531000+00:00
-- started: 2026-08-01T21:01:11.631000+00:00
-- ended: 2026-08-01T21:01:11.748000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
