-- job_id: ce5847e0-8dc0-4c2f-aec9-cd967c9fc791
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T07:06:34.114000+00:00
-- started: 2026-07-29T07:06:34.217000+00:00
-- ended: 2026-07-29T07:06:34.338000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
