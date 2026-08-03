-- job_id: cbabf271-0a8c-45e2-93ce-3f782e0d950b
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T04:06:32.436000+00:00
-- started: 2026-08-01T04:06:32.557000+00:00
-- ended: 2026-08-01T04:06:32.662000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
