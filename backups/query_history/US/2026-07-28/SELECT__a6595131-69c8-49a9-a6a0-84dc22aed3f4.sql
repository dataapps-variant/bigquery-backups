-- job_id: a6595131-69c8-49a9-a6a0-84dc22aed3f4
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T18:03:52.968000+00:00
-- started: 2026-07-28T18:03:53.088000+00:00
-- ended: 2026-07-28T18:03:53.221000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
