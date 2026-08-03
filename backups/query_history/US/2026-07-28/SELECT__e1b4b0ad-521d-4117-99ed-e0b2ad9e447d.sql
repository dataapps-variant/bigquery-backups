-- job_id: e1b4b0ad-521d-4117-99ed-e0b2ad9e447d
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T08:05:53.557000+00:00
-- started: 2026-07-28T08:05:53.675000+00:00
-- ended: 2026-07-28T08:05:53.778000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
