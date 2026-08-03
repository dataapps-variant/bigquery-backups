-- job_id: ea4ff6d3-91f2-48b1-9f23-6fb966c73bc6
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T06:02:51.837000+00:00
-- started: 2026-07-30T06:02:51.970000+00:00
-- ended: 2026-07-30T06:02:52.137000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
