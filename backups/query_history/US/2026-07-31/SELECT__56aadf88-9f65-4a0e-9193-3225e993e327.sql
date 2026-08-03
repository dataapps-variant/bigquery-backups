-- job_id: 56aadf88-9f65-4a0e-9193-3225e993e327
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T17:06:54.225000+00:00
-- started: 2026-07-31T17:06:54.361000+00:00
-- ended: 2026-07-31T17:06:54.478000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
