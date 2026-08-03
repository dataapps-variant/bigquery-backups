-- job_id: 688a2de7-d354-4780-b6cf-b3f27721c6a5
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T16:01:27.053000+00:00
-- started: 2026-07-30T16:01:27.189000+00:00
-- ended: 2026-07-30T16:01:27.335000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
