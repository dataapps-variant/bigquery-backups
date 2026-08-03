-- job_id: b9b20c30-1d20-46c1-8ff6-fcf338af1fb2
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T02:01:49.891000+00:00
-- started: 2026-08-02T02:01:50.023000+00:00
-- ended: 2026-08-02T02:01:50.183000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
