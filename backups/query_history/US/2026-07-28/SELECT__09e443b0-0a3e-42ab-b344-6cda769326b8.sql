-- job_id: 09e443b0-0a3e-42ab-b344-6cda769326b8
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T04:01:21.201000+00:00
-- started: 2026-07-28T04:01:21.349000+00:00
-- ended: 2026-07-28T04:01:21.476000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
