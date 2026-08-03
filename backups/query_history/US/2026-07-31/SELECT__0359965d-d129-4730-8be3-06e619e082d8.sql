-- job_id: 0359965d-d129-4730-8be3-06e619e082d8
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T13:03:44.439000+00:00
-- started: 2026-07-31T13:03:44.544000+00:00
-- ended: 2026-07-31T13:03:44.676000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
