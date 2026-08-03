-- job_id: 67afd3e9-62ec-454f-9e48-fa6398b02aee
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T19:01:23.383000+00:00
-- started: 2026-07-30T19:01:23.513000+00:00
-- ended: 2026-07-30T19:01:23.673000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
