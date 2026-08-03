-- job_id: a525c758-9be1-41cb-8286-53fd232c3d7c
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T11:02:32.417000+00:00
-- started: 2026-08-01T11:02:32.525000+00:00
-- ended: 2026-08-01T11:02:32.661000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
