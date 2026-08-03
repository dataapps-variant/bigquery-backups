-- job_id: c01756c8-0250-4483-807e-a0dd3aa828f2
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T22:06:43.516000+00:00
-- started: 2026-07-31T22:06:43.642000+00:00
-- ended: 2026-07-31T22:06:43.748000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'contractsdotnetllc' AND order_id IS NOT NULL
