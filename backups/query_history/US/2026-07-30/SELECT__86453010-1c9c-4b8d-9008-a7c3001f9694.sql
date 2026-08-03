-- job_id: 86453010-1c9c-4b8d-9008-a7c3001f9694
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T03:04:02.219000+00:00
-- started: 2026-07-30T03:04:02.363000+00:00
-- ended: 2026-07-30T03:04:02.466000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
