-- job_id: dadc7ddb-aef5-4e7d-8755-cb1cce73393a
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T08:02:54.384000+00:00
-- started: 2026-08-03T08:02:54.529000+00:00
-- ended: 2026-08-03T08:02:54.665000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
