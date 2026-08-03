-- job_id: 11592ef0-60cf-4936-b0f3-7ab73512d0d1
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T14:01:31.659000+00:00
-- started: 2026-08-02T14:01:31.830000+00:00
-- ended: 2026-08-02T14:01:31.968000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
