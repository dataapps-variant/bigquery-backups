-- job_id: d9a786cc-7d27-4e42-bf0a-fdf97b4de08c
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T13:03:43.152000+00:00
-- started: 2026-07-30T13:03:43.261000+00:00
-- ended: 2026-07-30T13:03:43.413000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
