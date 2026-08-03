-- job_id: 4a1ab629-9ad1-4010-b4a0-ee3669670c4f
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T13:26:07.223000+00:00
-- started: 2026-07-29T13:26:07.328000+00:00
-- ended: 2026-07-29T13:26:07.440000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
