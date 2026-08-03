-- job_id: 333fe67b-d25e-4fbd-a6a1-1f864b0760f3
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T14:06:48.489000+00:00
-- started: 2026-08-01T14:06:48.613000+00:00
-- ended: 2026-08-01T14:06:48.717000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
