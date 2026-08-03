-- job_id: b2fd3b2f-1095-4732-b146-12437883d7f8
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T14:01:44.821000+00:00
-- started: 2026-08-01T14:01:44.914000+00:00
-- ended: 2026-08-01T14:01:45.041000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
