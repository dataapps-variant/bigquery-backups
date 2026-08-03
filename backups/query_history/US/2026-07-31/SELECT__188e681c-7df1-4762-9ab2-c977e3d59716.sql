-- job_id: 188e681c-7df1-4762-9ab2-c977e3d59716
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T13:42:19.183000+00:00
-- started: 2026-07-31T13:42:19.284000+00:00
-- ended: 2026-07-31T13:42:22.386000+00:00


        SELECT
            Reporting_Date,
            App_Name,
            Plan_Name,
            BC,
            Cohort,
            Active_Inactive,
            `Table`,
            Single_Sale,
            T30D_New_Users,
            Subscriptions,
            Rebills,
            Churn_Rate,
            Refund_Rate,
            Gross_ARPU_Retention_Rate,
            Net_ARPU_Retention_Rate,
            Cohort_CAC,
            Recent_CAC,
            Gross_ARPU_Discounted,
            Net_ARPU_Discounted,
            Net_LTV_Discounted,
            BC4_CAC_Ceiling
        FROM `variant-finance-data-project.ICARUS_Multi.Final_Table`
