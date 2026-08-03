-- job_id: 7b29de11-7fcb-456e-b2a1-c9e7b78c6a5c
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:02:17.680000+00:00
-- started: 2026-07-28T13:02:17.802000+00:00
-- ended: 2026-07-28T13:02:18.046000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
