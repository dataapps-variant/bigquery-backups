-- job_id: 26b68e0f-d807-45ae-a8e7-262bd18054fa
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T07:01:12.671000+00:00
-- started: 2026-08-03T07:01:12.805000+00:00
-- ended: 2026-08-03T07:01:12.927000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
