-- job_id: 27f75c5d-d67c-4192-901f-68143be2861c
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T17:03:52.346000+00:00
-- started: 2026-07-30T17:03:52.429000+00:00
-- ended: 2026-07-30T17:03:52.553000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
