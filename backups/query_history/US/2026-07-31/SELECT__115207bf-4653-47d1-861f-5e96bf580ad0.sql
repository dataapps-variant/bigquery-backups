-- job_id: 115207bf-4653-47d1-861f-5e96bf580ad0
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T05:03:57.995000+00:00
-- started: 2026-07-31T05:03:58.127000+00:00
-- ended: 2026-07-31T05:03:58.240000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
