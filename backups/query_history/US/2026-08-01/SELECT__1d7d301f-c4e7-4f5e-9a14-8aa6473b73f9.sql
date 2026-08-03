-- job_id: 1d7d301f-c4e7-4f5e-9a14-8aa6473b73f9
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T02:02:14.505000+00:00
-- started: 2026-08-01T02:02:14.979000+00:00
-- ended: 2026-08-01T02:02:15.105000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
