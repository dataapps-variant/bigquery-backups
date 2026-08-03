-- job_id: 7075f0e6-39ee-48a2-8053-d55b16d05e27
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T23:02:10.325000+00:00
-- started: 2026-08-01T23:02:10.425000+00:00
-- ended: 2026-08-01T23:02:10.837000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
