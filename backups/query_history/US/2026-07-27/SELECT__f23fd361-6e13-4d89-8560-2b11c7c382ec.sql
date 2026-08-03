-- job_id: f23fd361-6e13-4d89-8560-2b11c7c382ec
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-27T15:07:47.659000+00:00
-- started: 2026-07-27T15:07:47.780000+00:00
-- ended: 2026-07-27T15:07:47.948000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
