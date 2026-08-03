-- job_id: 65b6d407-5650-463e-8716-14179ac57a9f
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T11:02:02.889000+00:00
-- started: 2026-07-28T11:02:03.038000+00:00
-- ended: 2026-07-28T11:02:03.156000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
