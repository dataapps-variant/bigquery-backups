-- job_id: 22017937-e43c-4e7e-b940-50f80e5ebd10
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-27T16:03:09.152000+00:00
-- started: 2026-07-27T16:03:09.255000+00:00
-- ended: 2026-07-27T16:03:09.413000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
