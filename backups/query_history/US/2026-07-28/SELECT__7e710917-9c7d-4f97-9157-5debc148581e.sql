-- job_id: 7e710917-9c7d-4f97-9157-5debc148581e
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T09:03:51.222000+00:00
-- started: 2026-07-28T09:03:51.341000+00:00
-- ended: 2026-07-28T09:03:51.617000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
