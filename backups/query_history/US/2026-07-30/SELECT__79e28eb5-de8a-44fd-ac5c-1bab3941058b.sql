-- job_id: 79e28eb5-de8a-44fd-ac5c-1bab3941058b
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T13:10:48.510000+00:00
-- started: 2026-07-30T13:10:48.599000+00:00
-- ended: 2026-07-30T13:10:48.734000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
