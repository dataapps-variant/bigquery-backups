-- job_id: d111b18d-ee95-4fb3-8465-9f360ba2a44c
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T20:01:59.039000+00:00
-- started: 2026-07-29T20:01:59.194000+00:00
-- ended: 2026-07-29T20:01:59.305000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
