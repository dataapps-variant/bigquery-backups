-- job_id: 394d1c58-c026-42eb-ae2b-9011983ace65
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:04:36.927000+00:00
-- started: 2026-07-28T14:04:37.155000+00:00
-- ended: 2026-07-28T14:04:37.288000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
