-- job_id: 093859ce-75a8-46a2-a93b-d97089b53d76
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T12:01:11.120000+00:00
-- started: 2026-07-29T12:01:11.185000+00:00
-- ended: 2026-07-29T12:01:11.322000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
