-- job_id: 32eed2ed-e4f5-4186-a4d3-3e89c0a6d465
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:21:12.834000+00:00
-- started: 2026-07-29T11:21:12.934000+00:00
-- ended: 2026-07-29T11:21:13.198000+00:00


WITH m AS (SELECT Report_date d, Billing_Cycle bc, Product_Name_Final p, Spend_Country_Code_AFID cy,
                  SUM(SS_Users) ss, SUM(T7D_Users) t7, SUM(Subscription_users) su
           FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`
           WHERE Report_date=(SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`)
           GROUP BY 1,2,3,4),
     f AS (SELECT Reporting_Date d, BC bc, Plan_Name p, Spend_Country_Code_AFID cy,
                  SUM(Single_Sale) sale, SUM(T7D_New_Users) t7n, SUM(Subscriptions) subs,
                  SUM(T7D_Daily_SS_Users) t7ss
           FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table`
           WHERE Cohort='7K_30D' AND `Table`='Regular'
             AND Reporting_Date=(SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`)
           GROUP BY 1,2,3,4)
SELECT COUNT(*) n_rows,
       COUNTIF(m.su=f.subs) subs_match,
       COUNTIF(m.ss=f.sale) ss_vs_single_sale,
       COUNTIF(m.ss=f.t7ss) ss_vs_t7d_daily_ss,
       COUNTIF(m.t7=f.t7n)  t7users_vs_t7d_new_users
FROM m JOIN f USING (d,bc,p,cy)
