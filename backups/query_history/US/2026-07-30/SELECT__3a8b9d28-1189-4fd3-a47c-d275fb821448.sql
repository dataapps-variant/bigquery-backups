-- job_id: 3a8b9d28-1189-4fd3-a47c-d275fb821448
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T13:08:02.679000+00:00
-- started: 2026-07-30T13:08:02.769000+00:00
-- ended: 2026-07-30T13:08:02.884000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
