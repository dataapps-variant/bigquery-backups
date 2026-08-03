-- job_id: 79783c6d-d47a-4370-8acf-5a6944e85308
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T00:05:36.361000+00:00
-- started: 2026-07-30T00:05:36.503000+00:00
-- ended: 2026-07-30T00:05:36.644000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
