-- job_id: bbc8d383-5c9a-4b9f-b877-e75097b06698
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T02:01:46.716000+00:00
-- started: 2026-08-01T02:01:46.883000+00:00
-- ended: 2026-08-01T02:01:47.009000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
