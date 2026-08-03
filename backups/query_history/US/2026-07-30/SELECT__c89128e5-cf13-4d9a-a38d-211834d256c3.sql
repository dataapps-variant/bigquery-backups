-- job_id: c89128e5-cf13-4d9a-a38d-211834d256c3
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T12:02:18.385000+00:00
-- started: 2026-07-30T12:02:18.485000+00:00
-- ended: 2026-07-30T12:02:18.591000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
