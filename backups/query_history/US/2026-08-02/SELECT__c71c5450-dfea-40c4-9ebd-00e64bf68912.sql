-- job_id: c71c5450-dfea-40c4-9ebd-00e64bf68912
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T18:03:27.826000+00:00
-- started: 2026-08-02T18:03:27.936000+00:00
-- ended: 2026-08-02T18:03:28.064000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
