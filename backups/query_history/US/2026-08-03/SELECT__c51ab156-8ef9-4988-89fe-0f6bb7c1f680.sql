-- job_id: c51ab156-8ef9-4988-89fe-0f6bb7c1f680
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T01:07:00.234000+00:00
-- started: 2026-08-03T01:07:00.368000+00:00
-- ended: 2026-08-03T01:07:00.505000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
