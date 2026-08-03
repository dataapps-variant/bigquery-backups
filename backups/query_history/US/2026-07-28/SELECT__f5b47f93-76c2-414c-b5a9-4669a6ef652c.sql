-- job_id: f5b47f93-76c2-414c-b5a9-4669a6ef652c
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T06:03:34.998000+00:00
-- started: 2026-07-28T06:03:35.141000+00:00
-- ended: 2026-07-28T06:03:35.273000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
