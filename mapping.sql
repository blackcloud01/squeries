

select top 10 * from gsecmstr where Isin='JP3404200002' 

select * from secmstr where name like 'COLUMBIA%PR%T%' and Type_=1

select * from secmap where SecCode=11105647 and VenType in (1, 16, 14, 35)

select top 10 * from prc.PrcInfo where code=43030

SELECT i.ticker,upper(i.ticker), secmstr.id, i.status, i.PrimaryFlag
      FROM prc.prcinfo i, secmstr, secmap
      WHERE secmstr.seccode=secmap.seccode
	AND i.code=secmap.vencode
	AND secmstr.type_=1
	AND secmap.ventype=14
	AND secmap.exchange=1
	and i.SecType='C'
	AND i.ticker IS NOT NULL
	AND secmstr.id IS NOT NULL



select * from secmap where seccode in (select seccode from secmap where vencode=43030 and ventype=14)

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
    and a.MarketDate > dateadd(dd,-7,'20150101')
    and 1000.0*(a.close_*b.numshrs) >  380726045618 
    and a.ExchIntCode in (select ExchIntCode from DS2Exchange where ExchCtryCode='US')
    and c.IsMajorSec = 'Y'
    and c.IBESTicker is not NULL



select * from SecVenType

select * from Ds2MnemChg where DsMnem like '%OBRA%'

select * from DS2CtryQtInfo where dsMnem like '%OBRA%'

select  * from GSecMstrX where name like 'OBRASC%'

select * from gsecmap where vencode=43939 and VenType=1

select * from GSecMapX where SecCode=60452

select * from 