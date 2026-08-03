-- job_id: 81fc2b19-b9ac-42f4-891d-70d049f84812
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-27T22:01:16.556000+00:00
-- started: 2026-07-27T22:01:16.664000+00:00
-- ended: 2026-07-27T22:01:16.773000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
