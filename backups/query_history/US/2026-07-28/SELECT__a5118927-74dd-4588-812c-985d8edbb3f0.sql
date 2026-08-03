-- job_id: a5118927-74dd-4588-812c-985d8edbb3f0
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T03:01:35.624000+00:00
-- started: 2026-07-28T03:01:35.764000+00:00
-- ended: 2026-07-28T03:01:35.900000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
