-- job_id: 0b71677f-c72e-4431-9cde-7ca41a9a3443
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T04:02:19.288000+00:00
-- started: 2026-08-02T04:02:19.434000+00:00
-- ended: 2026-08-02T04:02:19.586000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
