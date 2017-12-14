select * from CSNAItem where DESC_ like '%debt%' and GNAME like 'co_ifndq%'

select top 10 * from CSVSecurity where GVKEY= 136225

select top 10 * from CSVSecurity where DSCI like '%HCA%'

select top 10 * from CSVCompany where CONM like 'HCA%'
select  * from CSPITItem where category = 'Income' order by Mnemonic
select * from CSPITDFnd where GvKey=165675 and Item=188

select * from CSVSecurity where GVKEY =48056
select * from CSVCompany where GVKEY = 2849
select * from CSVSecurity where SEDOL like '610031%'

select * from CSRIndFmt 

select *   from CSCoIFndQ   where GVKEY=9698 and item in ( 194,192, 314)
and DATADATE >= DATEADD(mm, -12, '20111130') and DATADATE < '20111130'
and DATAFMT = 2 and DValue is not NULL

select * from CSRDataCode 

select * FROM CSNAItem where MNEMONIC like '%EBI%'

select * from CSCoIFndQ  where 
	gvkey='163610' and
        --datafmt=2 and
	item = 314 order by DATADATE 
	
	select * from CSCOIFNDQ where 
	gvkey='24436' and
        datafmt=2 and
		datadate='20091231'
		
select * from CSRDataFmt    

select * from CSCoIFndQ where GVKEY=10816 and Item=(select number from CSNAItem where MNEMONIC='ATQ' and GROUP_=218)
and datadate<='20120424' and datadate>=DATEADD(dd, -200, '20120424')  order by DATADATE

select * from CSCoAFnd where GVKEY = 1678 and DATAFMT=2 
and Item=(select number from CSNAItem where MNEMONIC='AT' and GROUP_=204)
and DATADATE='20111231' 

select * from CSRIndFmt 

select * from CSGCAD where GVKEY=15671

select * from CsgNtrmCoIDesc where GVKEY=210418

select * from CSGNtrmCoSA   where GVKEY=101299


select * from CSGNtrmCoSA a, CSGItm b  where a.GVKEY=101299 and a.DATADATE = '20121231'
and a.item=b.NUMBER and b.DESC_ like '%cash%' and b.GROUP_ = 56

select * from CSGNtrmCoSA  a, CSGItm b  where a.GVKEY=101299 and a.DATADATE = '20130630'
and a.item=b.NUMBER and b.MNEMONIC like 'AT%' and b.GROUP_ = 56


select * from CSGNTRMCOIDESC where GVKEY=101299 and DATAFMT=13


select * from CSGNtrmCoYTD where GVKEY=101299 and --DATADATE = '20130630' and
ITEM=(select number from CSGItm where MNEMONIC='OANCFY' and GROUP_ = 60)

select * from CSGItm where MNEMONIC like 'SAL%'


select distinct gname from CSGItm 

select * from CSGItm where DESC_ like 'Assets%'


select * from CSNAItem where DESC_ like '%operations%' and gname like 'co_afnd%'

select * from CSNAItem where DESC_ like '%dividend%per%' and group_ in (204, 205)

select * from CSNAItem where MNEMONIC like 'OPEPS%' and gname like 'co_afnd%'

select * from cscoifndq where gvkey=19932 and item = (select number from CSNAItem where MNEMONIC='DPQ' and GROUP_=218)

select * from csicoifndq where DATADATE >= '20110101' and item = (select number from CSNAItem where MNEMONIC='DVTQ' and GROUP_=218)
and gvkey=12141

select * from CSVCompany where GVKEY = 6475

select * from CSVCompany where conm like 'Microsoft%'


select top 10 * from xf.dbo.company where conm like 'AbbVi%'


select * from xf.dbo.company where gvkey = '061409'

select * from update_log where tablename like '%company%'

select * from CSGCIn where gvkey = 203612

select * from CSGCIn where CONML like 'BET%'

select top 10 * from CSGSec where gvkey = 100277

select * from csgcad where gvkey=101317 and datadate = (select max(datadate) from csgcad where gvkey=100277 and datadate<= '2015-03-01')

select c1.datadate, c1.value_, c2.curcd, x.fromcurm,x.tocurm, x.EXRATM from CSGCAF1 c1, csgcad c2, CSGXRM x where c1.gvkey=100277 and c1.indfmt=5 and 
c1.datadate = c2.datadate and c1.item=52 and
c1.gvkey = c2.GVKEY and c1.datadate = (select max(datadate) from csgcad where gvkey=100277 and datadate<= '2015-03-01') and
x.datadate = c1.datadate and
x.FROMCURM = c2.CURCD and
x.TOCURM = 'USD'

select * from CSGXRD where datadate > '2015-11-29' and FROMCURM='EUR' and TOCURM='GBP'

select c1.datadate, c1.value_, c2.curcd from CSGCAF1 c1, csgcad c2 where c1.gvkey=100277 and c1.indfmt=5 and 
c1.datadate = c2.datadate and c1.item=52 and
c1.gvkey = c2.GVKEY and c1.datadate = (select max(datadate) from csgcad where gvkey=100277 and datadate<= '2015-03-01') and
x.datadate = c1.datadate and
x.FROMCURM = c2.CURCD and
x.TOCURM = 'USD'

select c1.datadate, c1.value_, c2.curcd from CSGCAF1 c1, csgcad c2 where c1.gvkey=294764 and c1.indfmt=5 and 
        c1.datadate = c2.datadate and c1.item=(select number from csgitm where mnemonic='CSHO' and group_=10) and
        c1.gvkey = c2.GVKEY and c1.datadate = (select max(datadate) from csgcad where gvkey=294764 and datadate<= '20100831')


select * from csgitm where mnemonic='CSHO' and group_=10

select * from CSGCAF1 where gvkey=294764 and Item=133

select top 10 * from CSGSAF where secid = '29476401' and item = 52

select * from CSGSEC where gvkey=162401

select c.DATADATE, c.CSHOC from CSGSDP c where c.SECID=(select SECID from CSGSEC where gvkey=294764) 
and c.DATADATE = (select max(datadate) from CSGSDP where secid = c.secid and 


select GSECTOR, GGROUP, GIND, GSUBIND,* from CSGCIn where gvkey = 25648


select top 10 * from xf.dbo.company



SELECT pe.tradingItemId
    ,pe.pricingDate
    ,pe.priceClose
    ,isnull(daf.divAdjFactor,1) as divAdjFactor
    --Multiply by the divAdjFactor to create the adjusted price
    ,(pe.priceClose*isnull(daf.divAdjFactor,1)) divAdjPrice
    FROM xf.dbo.ciqPriceEquity pe
    left join ciqPriceEquityDivAdjFactor daf on pe.tradingItemId=daf.tradingItemId
    and pe.pricingDate>=daf.fromDate --Match the divAdjFactor
    and (pe.pricingDate<=daf.toDate or daf.toDate is null) --to the pricingDate
    WHERE
    pe.tradingItemId=2621697 --trading item for IBM
    ORDER BY pe.pricingDate desc