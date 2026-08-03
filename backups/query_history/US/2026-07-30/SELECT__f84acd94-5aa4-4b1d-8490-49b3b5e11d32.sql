-- job_id: f84acd94-5aa4-4b1d-8490-49b3b5e11d32
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T21:03:30.042000+00:00
-- started: 2026-07-30T21:03:30.170000+00:00
-- ended: 2026-07-30T21:03:30.322000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
