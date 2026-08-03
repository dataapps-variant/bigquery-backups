-- job_id: d366039e-ad8f-438d-a130-1d550b44cbfe
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T03:01:28.179000+00:00
-- started: 2026-08-03T03:01:28.302000+00:00
-- ended: 2026-08-03T03:01:28.459000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
