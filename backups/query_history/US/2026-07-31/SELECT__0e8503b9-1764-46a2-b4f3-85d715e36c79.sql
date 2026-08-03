-- job_id: 0e8503b9-1764-46a2-b4f3-85d715e36c79
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T06:15:32.418000+00:00
-- started: 2026-07-31T06:15:32.568000+00:00
-- ended: 2026-07-31T06:15:32.761000+00:00


           SELECT DISTINCT order_id, last_modified 
           FROM `variant-finance-data-project.Sticky_Data.missing_updated_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
