-- job_id: b9a0cde9-808d-458b-8f27-39b854eb8f45
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:03:57.455000+00:00
-- started: 2026-07-28T14:03:57.567000+00:00
-- ended: 2026-07-28T14:03:57.674000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
