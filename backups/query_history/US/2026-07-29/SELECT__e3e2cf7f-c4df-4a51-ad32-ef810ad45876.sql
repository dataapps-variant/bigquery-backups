-- job_id: e3e2cf7f-c4df-4a51-ad32-ef810ad45876
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T16:04:51.053000+00:00
-- started: 2026-07-29T16:04:51.251000+00:00
-- ended: 2026-07-29T16:04:51.377000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
