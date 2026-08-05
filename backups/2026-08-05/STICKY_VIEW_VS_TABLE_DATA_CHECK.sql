--AT
select Count(*) from variant-finance-data-project.Sticky_Data.Sticky_data_API_original_AT 
--4763133
where Test='0'
and Final_Order_Status in(2,6)
--2283782
select Count(*) from variant-finance-data-project.Sticky_Data.Sticky_data_API_original_AT_W_EC
--2283782
-----------------------------------------------------------------------------------------CN
select Count(*) from variant-finance-data-project.Sticky_Data.Sticky_data_API_original_CN 
--187762
where Test='0'
and Final_Order_Status in(2,6)
--56308

select Count(*) from variant-finance-data-project.Sticky_Data.Sticky_data_API_original_CN_W_EC
--56308
-----------------------------------------------------------------------------------
--CT
select Count(*) from variant-finance-data-project.Sticky_Data.Sticky_data_API_original_CT
--2709546
where Test='0'
and Final_Order_Status in(2,6)
--1403089

select Count(*) from variant-finance-data-project.Sticky_Data.Sticky_data_API_original_CT_W_EC
--1403089
------------------------------------------------------------------------------------
--FS
select Count(*) from variant-finance-data-project.Sticky_Data.Sticky_data_API_original_FS
--1421112
where Test='0'
and Final_Order_Status in(2,6)
--341836

select Count(*) from variant-finance-data-project.Sticky_Data.Sticky_data_API_original_FS_W_EC
--341836
---------------------------------------------------------------------------------------
--JF
select Count(*) from variant-finance-data-project.Sticky_Data.Sticky_data_API_original_JF
--5300159
where Test='0'
and Final_Order_Status in(2,6)
--2615687

select Count(*) from variant-finance-data-project.Sticky_Data.Sticky_data_API_original_JF_W_EC
--2615687
---------------------------------------------------------------------------------------
--PD_V
select Count(*) from variant-finance-data-project.Sticky_Data.Sticky_data_API_original_PD_V
--259953
where Test='0'
and Final_Order_Status in(2,6)
--139248

select Count(*) from variant-finance-data-project.Sticky_Data.Sticky_data_API_original_PD_V_W_EC
--139248
---------------------------------------------------------------------------------------
