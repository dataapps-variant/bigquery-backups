-- job_id: acd7a79a-37d9-41d7-932e-c4796f644684
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T13:40:27.972000+00:00
-- started: 2026-07-29T13:40:28.093000+00:00
-- ended: 2026-07-29T13:40:28.244000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
