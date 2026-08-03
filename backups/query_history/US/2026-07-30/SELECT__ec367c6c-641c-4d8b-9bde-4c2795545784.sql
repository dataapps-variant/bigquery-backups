-- job_id: ec367c6c-641c-4d8b-9bde-4c2795545784
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T10:03:40.006000+00:00
-- started: 2026-07-30T10:03:40.157000+00:00
-- ended: 2026-07-30T10:03:40.317000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
