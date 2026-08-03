-- job_id: 00ebbc19-a68a-455c-a50e-2f8465467aa6
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T11:01:21.759000+00:00
-- started: 2026-07-30T11:01:21.872000+00:00
-- ended: 2026-07-30T11:01:21.982000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
