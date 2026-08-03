-- job_id: 062c1fe3-3503-4ef0-abc0-05e93976ac79
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T18:02:51.429000+00:00
-- started: 2026-07-31T18:02:51.525000+00:00
-- ended: 2026-07-31T18:02:51.658000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
