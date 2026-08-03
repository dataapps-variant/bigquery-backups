-- job_id: 78224cab-8cba-4b19-99ec-14cc07420ebe
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T19:03:25.945000+00:00
-- started: 2026-07-28T19:03:26.089000+00:00
-- ended: 2026-07-28T19:03:26.227000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
