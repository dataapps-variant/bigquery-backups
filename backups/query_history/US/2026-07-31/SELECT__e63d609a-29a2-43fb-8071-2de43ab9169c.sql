-- job_id: e63d609a-29a2-43fb-8071-2de43ab9169c
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T04:06:24.606000+00:00
-- started: 2026-07-31T04:06:24.725000+00:00
-- ended: 2026-07-31T04:06:24.852000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
