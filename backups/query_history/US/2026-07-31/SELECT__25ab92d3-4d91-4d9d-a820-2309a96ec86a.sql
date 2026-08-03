-- job_id: 25ab92d3-4d91-4d9d-a820-2309a96ec86a
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T09:01:52.518000+00:00
-- started: 2026-07-31T09:01:52.677000+00:00
-- ended: 2026-07-31T09:01:52.798000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
