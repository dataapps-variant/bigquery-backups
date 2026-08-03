-- job_id: 1f7b6bcc-959f-44fa-8b6f-e31900ddbd1d
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T17:01:15.404000+00:00
-- started: 2026-07-29T17:01:15.524000+00:00
-- ended: 2026-07-29T17:01:15.727000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
