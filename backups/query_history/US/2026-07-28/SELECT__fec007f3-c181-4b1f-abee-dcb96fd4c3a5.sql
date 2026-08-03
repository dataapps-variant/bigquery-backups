-- job_id: fec007f3-c181-4b1f-abee-dcb96fd4c3a5
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T22:02:43.267000+00:00
-- started: 2026-07-28T22:02:43.401000+00:00
-- ended: 2026-07-28T22:02:43.512000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
