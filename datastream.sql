
-- Datastream Security identofier table

select TOP 10 * from DS2Security where PrimExchMnem  = 'HKG' and ISOCurrCode = 'CNY'



select * from DS2Security where  PrimExchMnem  in ('XLF')

select * from DS2Security where PrimQtSedol like '2371823%'

select * from DS2Security where PrimQtInfoCode = '64003'

select * from DS2Security where DsSecName LIKE 'Alphabet%'

select * from DS2Security where DsCmpyCode = 133939

select top 10 * from DS2Company where DsCmpyName like '%STOXX%'

--select top 10 * from DS2Company where DsCmpyCode = 9227

select *  from DS2Security 
where 
DsCmpyCode in (  select DsCmpyCode  from DS2Company where CmpyCtryCode in('BR')) and
PrimExchMnem in ('NYS','NAS','ASE','NMS', 'LON','BSP') 


select * from DS2CtryQtInfo where InfoCode = 259497

select * from DS2CtryQtInfo where DsMnem like '%GSM%' and statuscode = 'A' and isPrimQt = 1 and region='US'

select * from DS2Security  where PrimQtInfoCode  =234879
select * from DS2Security  where IBESTicker like '%ARU'
select * from DS2Security  where DsSecName like '%SPD%' and IsMajorSec='Y' and ISOCurrCode='USD' and PrimQtSedol like '242%'
select * from DS2Security  where IBESTicker like '%XLV%'

select dssecname, primqtsedol, PrimQtInfoCode, IBESTicker from DS2Security  where PrimQtSedol like '2402466%'

select dssecname, primqtsedol, PrimQtInfoCode, IBESTicker from DS2Security  where PrimQtInfoCode like '736%'

select * from DS2NumShares where InfoCode = 267316

select * from DS2PrimQtPrc where InfoCode = 73580 and MarketDate <= '20170228' and MarketDate >= '20160101'

select * from DS2PrimQtRI  where InfoCode = 46157 and MarketDate <= '20051015' and MarketDate >= '20040901'

select * from DS2XRef where Type_ = 2

--Datastream echanges

select * from DS2Exchange  order by ExchName 
select * from DS2Region

select top 10 * from DS2Div where EffectiveDate = '20160808'

select * from DS2Exchange d1, DS2Region d2 where d1.ExchCtryCode = d2.DsGeoCode order by d2.Name_ 

select  YEAR(marketdate), month(MarketDate ),SUM(volume),SUM(Close_ * Volume )/ COUNT( volume)
from DS2PrimQtPrc  where InfoCode = 49155
and MarketDate <= '20111130'
and MarketDate >= DATEADD(m, -6, '20111130')
group by YEAR( MarketDate), MONTH( marketdate)
order by YEAR( marketdate), MONTH( marketdate)

select top 10 * from DS2NumShares where InfoCode = 46171

select MarketDate , year(marketdate), month( MarketDate) ,  Volume  from DS2PrimQtPrc where InfoCode = 252173
and MarketDate between DATEADD(dd, -500, '20110227') and '20110227'

select DsLocalCode from DS2CtryQtInfo where DsMnem = 'U:HUM'

select ExRateIntCode from DS2FXCode where FromCurrCode = 'CLP' and ToCurrCode = 'USD' and RateTypeCode = 'SPOT'

select MidRate from DS2FXRate where 
ExRateIntCode = (select ExRateIntCode from DS2FXCode 
                 where FromCurrCode = 'CLP' and ToCurrCode = 'USD' and
                 RateTypeCode = 'SPOT')
                 

select cusip  from prc.prcinfo where ticker='MRK'

select  * from Ds2MnemChg where ticker = 'VRSK' order by EndDate

select  * from Ds2MnemChg where infoCode=50476 order by EndDate

select * from DS2Security where PrimQtInfoCode =236578


select dp.InfoCode,ds.PrimQtSedol,ds.DsSecName , 
    dp.marketdate, dp.Close_, dn.NumShrs*1000,
    (dp.Close_ * dn.NumShrs*1000)  as mktcap, dc.DsCmpyCode, dc.CmpyCtryCode 
    from DS2Security ds, DS2PrimQtPrc dp, DS2NumShares dn, DS2Company as dc
    where
    ds.PrimQtInfoCode = dp.InfoCode and
    ds.PrimQtInfoCode = dn.InfoCode and
    ds.DsCmpyCode = dc.DsCmpyCode and
    dn.InfoCode = dp.InfoCode and
    dc.CmpyCtryCode in ('BR') and
    ds.PrimExchMnem in ('NYS','NAS','ASE','NMS', 'LON')  and
    dn.EventDate = (select MAX(eventdate) from DS2NumShares where InfoCode = ds.PrimQtInfoCode) and 
    dp.marketdate = (select MAX(MarketDate) from DS2PrimQtPrc  where InfoCode = ds.PrimQtInfoCode and MarketDate<= '20120531')
    and dp.close_ is not NULL and
    (dp.Close_ * dn.NumShrs*1000) >= 000.0 and
    dp.MarketDate >= dateadd(dd,-7,'20120531')
    
    select * from DS2NumShares where InfoCode = 46244
    select * from DS2PrimQtPrc  where InfoCode = 287143

	sp_help secmstr

	select * from DS2Exchange where ExchCtryCode='US'
	
	select * from DS2Security  where DsSecName like 'ferroglobe%' and IsMajorSec='Y'
	
	select * from DS2Security  where PrimQtInfoCode = 45965

	select a.InfoCode, c.DsSecName, c.IBESTicker,  a.marketdate, b.eventdate, a.close_, b.numshrs, 1000*a.close_*b.numshrs 
	from DS2PrimQtPrc a, DS2NumShares b, DS2Security c
	where  a.InfoCode=b.InfoCode and
	a.InfoCode = c.PrimQtInfoCode and
	a.MarketDate = (select max(MarketDate) from DS2PrimQtPrc where InfoCode=a.InfoCode and 
	                MarketDate < '20150101') 
	and
	b.EventDate = (select max(eventDate) from DS2NumShares where InfoCode=b.InfoCode and
					EventDate <= a.MarketDate)
	and
	a.Close_ is not NULL
	and a.MarketDate > '20141201'
	and (a.close_*b.numshrs) > 300000.0
	and a.ExchIntCode in (select ExchIntCode from DS2Exchange where ExchCtryCode='US')
	and c.IsMajorSec = 'Y'
	and c.IBESTicker is not NULL
	
    
    

select * from DS2EquityIndex where DSIndexCode = 41620
select * from DS2EquityIndex where IndexDesc like '%S&P%50%' and ISOCurrCode='EUR'
select * from DS2EquityIndex where ISOCurrCode='JPY' and IndexDesc like '%TOPIX%'
select * from DS2IndexData where DSIndexCode = 13210 and ValueDate >= '20160320'

select * from DS2EquityIndex where IndexDesc like '%S&P%500%' and region = 'US' and ISOCurrCode='USD'


select * from GPrcExr where Currency_=1040 and date_='20140815'

SELECT * FROM GPRCEXR select * from GPrcCode where Type_=8 and Desc_ = 'AUD'


select MidRate from DS2FXRate where ExRateIntCode=1283 and ExRateDate='20090130'

select  FromCurrCode, ExRateIntCode from DS2FXCode where FromCurrCode in ('USD', 'HKD', 'GBp') and ToCurrCode='USD' and RateTypeCode='SPOT'

select fc.FromCurrCode, xr.MidRate from DS2FXRate xr, DS2FXCode fc where fc.FromCurrCode in ('AUD', 'USD') and fc.ToCurrCode='USD' and fc.RateTypeCode='SPOT'
and xr.ExRateDate= '20090115' and xr.ExRateIntCode=fc.ExRateIntCode


select * from ds2div where infocode=46244

select MarketDate, Close_  from DS2PrimQtPrc where InfoCode = 34449
and MarketDate >= dateadd(YY,-8,'2013-01-29')  and MarketDate <= '2013-01-29 00:00:00'

select * from DS2PrimQtRI where InfoCode = 34449 and MarketDate >= '2016-04-01 00:00:00'



select dateadd(dd,-2764,'2013-01-29 00:00:00')


select ISOCurrCode, SUM(Volume*Close_)/COUNT(Volume) from DS2PrimQtPrc where InfoCode = 234879 and 
        MarketDate between DATEADD(DD, %i, '20010101') and '20010101' group by ISOCurrCode


-- ('GB','FR', 'DE', 'ES', 'IT', 'SE', 'NO', 'FI', 'CH', 'DK', 'NL')

select * from DS2Exchange where ExchCtryCode in ('GB','FR', 'DE', 'ES', 'IT', 'SE', 'NO', 'FI', 'CH', 'DK', 'NL')

select * from DS2Exchange where ExchName like '%COPEN%'


select p.infocode, c.PrimExchMnem, c.DsSecName, p.Marketdate, s.NumShrs, p.Close_, s.NumShrs,p.Close_*s.NumShrs*1000.0,
(select MidRate from DS2FXRate where
                                    ExRateIntCode = ( select ExRateIntCode from DS2FXCode where
                                                      ToCurrCode = 'USD' and FromCurrCode = p.ISOCurrCode
                                                      and RateTypeCode = 'SPOT')
                                    and ExRateDate = p.MarketDate ) as xrate,
 p.Close_*s.NumShrs*1000.0/(select MidRate from DS2FXRate where
                                    ExRateIntCode = ( select ExRateIntCode from DS2FXCode where
                                                      ToCurrCode = 'USD' and FromCurrCode = p.ISOCurrCode
                                                      and RateTypeCode = 'SPOT')
                                    and ExRateDate = p.MarketDate ) as mcap_usd
 
    from DS2PrimQtPrc p, DS2NumShares s, DS2Security c
	where p.InfoCode = s.InfoCode 
	and p.ExchIntCode in (select ExchIntCode from DS2Exchange where ExchCtryCode='GB')
	and p.Close_ is not NULL
	and c.IsMajorSec = 'Y'
	and c.IBESTicker is not NULL
	and p.InfoCode = c.PrimQtInfoCode
	and p.MarketDate > dateadd(dd,-7,'20151124')
    and (p.Close_*s.NumShrs*1000.0/(select MidRate from DS2FXRate where
                                    ExRateIntCode = ( select ExRateIntCode from DS2FXCode where
                                                      ToCurrCode = 'USD' and FromCurrCode = p.ISOCurrCode
                                                      and RateTypeCode = 'SPOT')
                                    and ExRateDate = p.MarketDate )) > 1000000000
    and p.MarketDate = (select MAX(MarketDate) from DS2PrimQtPrc where InfoCode = p.InfoCode and MarketDate <= '20151124')
    and s.EventDate = (select MAX(EventDate) from DS2NumShares where InfoCode =p.InfoCode and EventDate<=p.MarketDate)



select top 10 * from DS2CtryQtInfo where region in ('NL') and TypeCode = 'EQ' and CovergCode='F'


select *  from DS2PrimQtPrc where InfoCode = 47697 and
        MarketDate = (select MAX(marketdate) from DS2PrimQtPrc where InfoCode = 46640 and
		MarketDate <= '19950104' and 
        MarketDate > DATEADD(dd, -20, '19950104'))


select ExRateDate, MidRate from DS2FXRate where 
ExRateIntCode = ( select ExRateIntCode from DS2FXCode where
                  ToCurrCode = 'DKK' and FromCurrCode = 'USD' and RateTypeCode = 'SPOT')
and ExRateDate <= '20091231' and ExRateDate > dateadd(dd, -20, '20091231')

select * from DS2FXCode where FromCurrCode = 'FRF' and RateTypeCode = 'SPOT'
select * from DS2FXCode where ToCurrCode = 'FRF' and RateTypeCode = 'SPOT'

select * from DS2PrimQtPrc where InfoCode =13210 and MarketDate > '20040102'

select * from DS2XRef where Type_=3 order by code and code='GBP'

select p.Marketdate,  
        case 
	when p.ISOCurrCode = 'GBP' then 0.01*p.Close_
	else p.Close_
	end
        from DS2PrimQtPrc p where p.InfoCode=46093 and
        p.MarketDate = (select MAX(MarketDate) from DS2PrimQtPrc where
                        InfoCode = p.InfoCode and MarketDate <= '2015-01-02')

select min(ExpYear) from prc.OptCntr where Ticker = 'SPY'
select * from prc.OptCntr where Ticker='SPY' and Strike =200000 and ExpDate = '2016-08-19' and PutCall = 'P'
select * from prc.OptCntr where Ticker='SPY' and Strike < 110000 and ExpYear <= 2010 and PutCall = 'P' Order by ExpDate
select * from OptCntrChg where Ticker='SPY' and ExpYear <= 2010 and PutCall = 'P' Order by ExpDate

select * from prc.OptCntr where Ticker='SPY' and Strike = 157000 and ExpYear = 2013 and PutCall = 'P' 
Order by ExpDate

select  * from OptDly where ContrCode = 12017399 and Date_ > '2013-06-10' and  Date_ < '2013-06-22'

select top 10 * from DS2CtryQtInfo where DsQtName like 'OBRAS%'

select i.InfoCode, i.Marketdate,  
                        case 
                        when p.ISOCurrCode = 'USD' then i.RI 
                        when p.ISOCurrCode = 'GBP' then 0.01*i.RI/(select MidRate from DS2FXRate where 
		                                                   ExRateIntCode = ( select ExRateIntCode from DS2FXCode where 
		                                                                     ToCurrCode = 'USD' and FromCurrCode = p.ISOCurrCode 
		                                                                     and RateTypeCode = 'SPOT')
                                                                   and ExRateDate = i.MarketDate )
                        else i.RI/(select MidRate from DS2FXRate where
                                   ExRateIntCode = ( select ExRateIntCode from DS2FXCode where ToCurrCode = 'USD' and
                                                     FromCurrCode = p.ISOCurrCode and RateTypeCode = 'SPOT')
                                   and ExRateDate = i.MarketDate)
                        end as xrate,
						i.RI as tr
                        from DS2PrimQtRI i , DS2PrimQtPrc p where i.InfoCode in (20679) and i.InfoCode = p.InfoCode and
                        i.MarketDate = p.MarketDate and i.MarketDate >= dateadd(dd,-100,'2016-07-21') and
                        i.MarketDate <= '2016-07-21' and i.RI > 0


select * from Ds2IndexData where DSIndexCode=41620 and ValueDate>='20160901' and ValueDate<='20160915'
               and RI is not NULL order by ValueDate

select * from DS2IndexData where valueDate	= '20160912'

select * from DS2EquityIndex where IndexDesc like '%S&P%500%' and region = 'US' and ISOCurrCode='USD'
select * from DS2EquityIndex where DSIndexCode in (41620, 46597)
select * from Update_Log where tablename = 'DS2IndexData' order by FileDate