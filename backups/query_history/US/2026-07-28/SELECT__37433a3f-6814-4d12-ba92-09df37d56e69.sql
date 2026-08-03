-- job_id: 37433a3f-6814-4d12-ba92-09df37d56e69
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T07:07:53.364000+00:00
-- started: 2026-07-28T07:07:53.475000+00:00
-- ended: 2026-07-28T07:07:53.592000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
