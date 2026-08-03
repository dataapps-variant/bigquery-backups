-- job_id: 32f9997e-1b42-4c0a-8413-68cfcf40eacf
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-30T06:11:11.506000+00:00
-- started: 2026-07-30T06:11:12.015000+00:00
-- ended: 2026-07-30T06:11:13.193000+00:00


        DELETE FROM `variant-finance-data-project.Sticky_Data.missing_updated_orders`
        WHERE company = 'brainable' AND order_id IN ('4841221', '4880104')
