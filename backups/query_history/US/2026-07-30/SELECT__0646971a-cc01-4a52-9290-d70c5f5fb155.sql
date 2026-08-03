-- job_id: 0646971a-cc01-4a52-9290-d70c5f5fb155
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T19:04:42.078000+00:00
-- started: 2026-07-30T19:04:42.222000+00:00
-- ended: 2026-07-30T19:04:42.330000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
