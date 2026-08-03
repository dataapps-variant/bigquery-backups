-- job_id: c44cdf14-e90d-4e13-8bcc-000fd01b76fe
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T06:18:36.798000+00:00
-- started: 2026-07-30T06:18:36.893000+00:00
-- ended: 2026-07-30T06:18:37.076000+00:00


           SELECT DISTINCT order_id, last_modified 
           FROM `variant-finance-data-project.Sticky_Data.missing_updated_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
