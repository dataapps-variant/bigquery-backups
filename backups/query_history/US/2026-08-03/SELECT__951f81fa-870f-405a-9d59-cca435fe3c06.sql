-- job_id: 951f81fa-870f-405a-9d59-cca435fe3c06
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T05:05:21.661000+00:00
-- started: 2026-08-03T05:05:21.810000+00:00
-- ended: 2026-08-03T05:05:22.081000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
