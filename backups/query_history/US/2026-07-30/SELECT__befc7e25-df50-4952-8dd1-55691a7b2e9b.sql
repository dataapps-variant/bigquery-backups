-- job_id: befc7e25-df50-4952-8dd1-55691a7b2e9b
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T08:01:30.319000+00:00
-- started: 2026-07-30T08:01:30.448000+00:00
-- ended: 2026-07-30T08:01:30.589000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
