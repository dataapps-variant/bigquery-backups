-- job_id: 5b6daad0-e91a-4318-b87b-8f587d7f9029
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T08:08:30.479000+00:00
-- started: 2026-08-02T08:08:30.607000+00:00
-- ended: 2026-08-02T08:08:30.715000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
