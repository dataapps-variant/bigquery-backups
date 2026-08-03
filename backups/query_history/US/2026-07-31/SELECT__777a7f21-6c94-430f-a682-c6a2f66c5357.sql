-- job_id: 777a7f21-6c94-430f-a682-c6a2f66c5357
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T18:04:19.263000+00:00
-- started: 2026-07-31T18:04:19.377000+00:00
-- ended: 2026-07-31T18:04:19.513000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
