-- job_id: 1c285611-9e1d-4f7b-92dc-0b9c5c6bc703
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T20:07:28.670000+00:00
-- started: 2026-07-28T20:07:28.885000+00:00
-- ended: 2026-07-28T20:07:28.990000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
