-- job_id: 51d8c6c2-8517-4134-8549-344b1cced1aa
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T19:03:18.795000+00:00
-- started: 2026-07-29T19:03:18.903000+00:00
-- ended: 2026-07-29T19:03:19.019000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
