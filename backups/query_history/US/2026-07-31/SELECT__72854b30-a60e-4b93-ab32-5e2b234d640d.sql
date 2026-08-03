-- job_id: 72854b30-a60e-4b93-ab32-5e2b234d640d
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T13:07:13.037000+00:00
-- started: 2026-07-31T13:07:13.178000+00:00
-- ended: 2026-07-31T13:07:13.312000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
