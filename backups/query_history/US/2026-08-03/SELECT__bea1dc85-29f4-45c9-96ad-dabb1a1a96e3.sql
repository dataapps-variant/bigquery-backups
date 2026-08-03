-- job_id: bea1dc85-29f4-45c9-96ad-dabb1a1a96e3
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:04:23.225000+00:00
-- started: 2026-08-03T10:04:23.334000+00:00
-- ended: 2026-08-03T10:04:23.440000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
