select ic.financialInstanceId, fi.periodEndDate [fiscaldate], fi.filingDate [reportdate], year(fi.periodEndDate),
    fp.fiscalYear, fp.fiscalQuarter, fp.periodTypeId, fi.instanceTypeId, c.countryId,
    fi.currencyId, fd.dataItemId, fd.dataItemValue
from xf.dbo.ciqCompany c
join xf.dbo.ciqFinPeriod fp on fp.companyId=c.companyId
    and fp.periodTypeId in (2,10) -- 1 Annual, 2 Quarterly, 3 YTD, 4 LTM, 10 Semi-Annual
join xf.dbo.ciqFinInstance fi on fi.financialPeriodId=fp.financialPeriodId
    and fi.instanceTypeId in (2) -- 1 Press Release, 2 Filed Report
join xf.dbo.ciqFinInstanceToCollection ic on ic.financialInstanceId=fi.financialInstanceId
join xf.dbo.ciqFinCollectionData fd on fd.financialCollectionId=ic.financialCollectionId
    and fd.dataItemId in (1007) --1007 Total Assets, 3064 eps x-items
join xf.dbo.ciqFinCollection fc on fc.financialCollectionId=fd.financialCollectionId
    and fc.nonStandardLengthFlag=0
where c.companyId=874356
and fp.fiscalYear in (2011,2012, 2013)
order by fi.filingDate, fi.periodEndDate, fi.latestForFinancialPeriodFlag 

--###########################################################################
SELECT *            FROM xf.dbo.ciqSymbol cs
            WHERE (cs.symbolTypeId = 5701 OR cs.symbolTypeId = 22)
                AND cs.symbolValue like '434178%'

select TOP 10 * from xf.dbo.ciqCompany where companyName like 'Georg%Fish%'
select TOP 10 * from xf.dbo.ciqCompany where companyId = 874356
--select top 10 *  from xf.dbo.ciqFinInstance

select *  from xf.dbo.ciqFinPeriod where companyId = 874356 and fiscalYear = 2013

select periodTypeId, COUNT(periodTypeId)  from xf.dbo.ciqFinPeriod where companyId = 874356 and fiscalYear = 2012
group by periodTypeId 

select * from xf.dbo.ciqPeriodType

select * from xf.dbo.ciqSymbolType 



select ic.financialInstanceId, fi.periodEndDate [fiscaldate], fi.filingDate [reportdate], year(fi.periodEndDate),
    fp.fiscalYear, fp.fiscalQuarter, fp.periodTypeId, fi.instanceTypeId, c.countryId,
    fi.currencyId, fd.dataItemId, fd.dataItemValue
from xf.dbo.ciqCompany c
join xf.dbo.ciqFinPeriod fp on fp.companyId=c.companyId
    and fp.periodTypeId in (2,10) -- 1 Annual, 2 Quarterly, 3 YTD, 4 LTM, 10 Semi-Annual
join xf.dbo.ciqFinInstance fi on fi.financialPeriodId=fp.financialPeriodId
    and fi.instanceTypeId in (2) -- 1 Press Release, 2 Filed Report
join xf.dbo.ciqFinInstanceToCollection ic on ic.financialInstanceId=fi.financialInstanceId
join xf.dbo.ciqFinCollectionData fd on fd.financialCollectionId=ic.financialCollectionId
    and fd.dataItemId in (3064) --1007 Total Assets, 3064 eps x-items
join xf.dbo.ciqFinCollection fc on fc.financialCollectionId=fd.financialCollectionId
    and fc.nonStandardLengthFlag=0
where c.companyId=675195
and fi.periodEndDate = '2002-05-31'
--and fi.filingDate = '2013-02-14'
--and fp.fiscalYear in (2002, 2003)
order by fi.filingDate, fi.periodEndDate, fi.latestForFinancialPeriodFlag 


select * from xf.dbo.ciqDataItem where dataItemName like 'Minority%'

select * from xf.dbo.ciqDataItem where dataItemId = 3064