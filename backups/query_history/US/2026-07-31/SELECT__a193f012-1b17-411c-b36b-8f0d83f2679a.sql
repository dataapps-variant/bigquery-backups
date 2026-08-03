-- job_id: a193f012-1b17-411c-b36b-8f0d83f2679a
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T03:01:31.605000+00:00
-- started: 2026-07-31T03:01:31.720000+00:00
-- ended: 2026-07-31T03:01:31.865000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
