-- job_id: fd31ef30-aede-49c0-88ce-4b4f3d391228
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T01:03:53.515000+00:00
-- started: 2026-07-29T01:03:53.633000+00:00
-- ended: 2026-07-29T01:03:53.763000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
