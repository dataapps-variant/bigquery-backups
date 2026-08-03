-- job_id: 4309cb0d-56d0-4c3f-96f6-d3a90654ebc7
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T11:06:29.877000+00:00
-- started: 2026-08-02T11:06:29.966000+00:00
-- ended: 2026-08-02T11:06:30.061000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
