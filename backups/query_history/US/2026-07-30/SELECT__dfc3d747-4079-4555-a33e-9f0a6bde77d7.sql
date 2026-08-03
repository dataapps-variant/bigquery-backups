-- job_id: dfc3d747-4079-4555-a33e-9f0a6bde77d7
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T23:01:56.257000+00:00
-- started: 2026-07-30T23:01:56.454000+00:00
-- ended: 2026-07-30T23:01:56.572000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
