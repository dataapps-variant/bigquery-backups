-- job_id: 983cad06-79b3-4e16-8eb5-4240d45ef8e4
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T08:01:52.567000+00:00
-- started: 2026-08-01T08:01:52.673000+00:00
-- ended: 2026-08-01T08:01:52.806000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
