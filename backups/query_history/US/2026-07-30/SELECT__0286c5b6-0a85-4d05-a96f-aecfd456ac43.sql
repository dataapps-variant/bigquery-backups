-- job_id: 0286c5b6-0a85-4d05-a96f-aecfd456ac43
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T11:01:32.625000+00:00
-- started: 2026-07-30T11:01:32.714000+00:00
-- ended: 2026-07-30T11:01:32.822000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
