-- job_id: d7190075-c0ca-46f6-be8f-a74ec50ccd32
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:03:30.673000+00:00
-- started: 2026-07-28T10:03:30.727000+00:00
-- ended: 2026-07-28T10:03:30.813000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
