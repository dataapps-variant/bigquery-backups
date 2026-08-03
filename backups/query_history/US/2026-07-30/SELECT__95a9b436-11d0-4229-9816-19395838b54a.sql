-- job_id: 95a9b436-11d0-4229-9816-19395838b54a
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T13:04:00.793000+00:00
-- started: 2026-07-30T13:04:00.931000+00:00
-- ended: 2026-07-30T13:04:01.188000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
