-- job_id: e919ab38-5c2d-4018-b077-7ff9316f37cb
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T11:02:00.076000+00:00
-- started: 2026-08-01T11:02:00.189000+00:00
-- ended: 2026-08-01T11:02:00.304000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
