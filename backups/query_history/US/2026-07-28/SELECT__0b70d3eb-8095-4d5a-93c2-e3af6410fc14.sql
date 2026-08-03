-- job_id: 0b70d3eb-8095-4d5a-93c2-e3af6410fc14
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T17:04:45.517000+00:00
-- started: 2026-07-28T17:04:45.805000+00:00
-- ended: 2026-07-28T17:04:45.953000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
