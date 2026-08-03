-- job_id: 02899752-c828-4a7e-8410-4324dfa63a8b
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:01:53.742000+00:00
-- started: 2026-08-03T13:01:53.834000+00:00
-- ended: 2026-08-03T13:01:53.968000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
