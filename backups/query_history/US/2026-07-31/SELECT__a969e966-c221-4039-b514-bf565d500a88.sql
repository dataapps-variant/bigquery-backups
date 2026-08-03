-- job_id: a969e966-c221-4039-b514-bf565d500a88
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T20:03:25.885000+00:00
-- started: 2026-07-31T20:03:26.080000+00:00
-- ended: 2026-07-31T20:03:26.219000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
