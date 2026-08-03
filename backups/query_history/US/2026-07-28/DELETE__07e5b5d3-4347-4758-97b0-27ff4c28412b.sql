-- job_id: 07e5b5d3-4347-4758-97b0-27ff4c28412b
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-28T05:30:18.513000+00:00
-- started: 2026-07-28T05:30:18.926000+00:00
-- ended: 2026-07-28T05:30:20.087000+00:00


        DELETE FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Exchnage_Rate`
        WHERE Date = @date_val
