-- job_id: 97211bc5-d023-49b7-8b0d-78a51a7e6f50
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T14:01:33.477000+00:00
-- started: 2026-07-31T14:01:33.610000+00:00
-- ended: 2026-07-31T14:01:33.750000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
