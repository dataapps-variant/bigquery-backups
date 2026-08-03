-- job_id: ea37450c-1999-491c-a613-e06e60f93b4e
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T20:07:33.870000+00:00
-- started: 2026-07-30T20:07:33.989000+00:00
-- ended: 2026-07-30T20:07:34.125000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
