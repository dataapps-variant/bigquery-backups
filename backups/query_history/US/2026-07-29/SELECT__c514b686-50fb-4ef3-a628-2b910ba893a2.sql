-- job_id: c514b686-50fb-4ef3-a628-2b910ba893a2
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T21:05:48.453000+00:00
-- started: 2026-07-29T21:05:48.659000+00:00
-- ended: 2026-07-29T21:05:48.798000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
