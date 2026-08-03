-- job_id: a520f577-a8e2-434a-8cf0-150b681211cd
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T18:01:48.285000+00:00
-- started: 2026-08-01T18:01:48.397000+00:00
-- ended: 2026-08-01T18:01:48.507000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
