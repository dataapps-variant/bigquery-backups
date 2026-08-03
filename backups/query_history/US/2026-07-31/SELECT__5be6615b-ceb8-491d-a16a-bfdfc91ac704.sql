-- job_id: 5be6615b-ceb8-491d-a16a-bfdfc91ac704
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T08:02:50.497000+00:00
-- started: 2026-07-31T08:02:50.617000+00:00
-- ended: 2026-07-31T08:02:50.758000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
