-- job_id: abba1ebb-bb18-4fd5-baf5-c4a716dc26bd
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T17:03:08.171000+00:00
-- started: 2026-07-28T17:03:08.267000+00:00
-- ended: 2026-07-28T17:03:08.391000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
