-- job_id: 8bc0aa08-46f1-4e5b-aa63-4bd43aed53da
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T09:03:58.001000+00:00
-- started: 2026-07-29T09:03:58.094000+00:00
-- ended: 2026-07-29T09:03:58.217000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
