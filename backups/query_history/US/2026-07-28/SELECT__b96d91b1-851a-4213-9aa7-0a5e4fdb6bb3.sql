-- job_id: b96d91b1-851a-4213-9aa7-0a5e4fdb6bb3
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T08:04:20.229000+00:00
-- started: 2026-07-28T08:04:20.371000+00:00
-- ended: 2026-07-28T08:04:20.497000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
