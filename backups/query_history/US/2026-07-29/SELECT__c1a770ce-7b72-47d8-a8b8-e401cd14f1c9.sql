-- job_id: c1a770ce-7b72-47d8-a8b8-e401cd14f1c9
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T11:01:08.580000+00:00
-- started: 2026-07-29T11:01:08.678000+00:00
-- ended: 2026-07-29T11:01:08.800000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
