-- job_id: a840cf93-1c19-41c5-a42d-217dc7194668
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T05:05:12.375000+00:00
-- started: 2026-07-28T05:05:12.479000+00:00
-- ended: 2026-07-28T05:05:12.596000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
