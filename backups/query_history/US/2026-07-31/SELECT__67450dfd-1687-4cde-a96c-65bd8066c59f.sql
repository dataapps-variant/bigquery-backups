-- job_id: 67450dfd-1687-4cde-a96c-65bd8066c59f
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T11:06:24.071000+00:00
-- started: 2026-07-31T11:06:24.194000+00:00
-- ended: 2026-07-31T11:06:24.320000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
