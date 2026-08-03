-- job_id: cf00e4ba-c514-4ad8-ad2b-4d126f85b2e3
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T20:01:47.350000+00:00
-- started: 2026-08-02T20:01:47.478000+00:00
-- ended: 2026-08-02T20:01:47.598000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
