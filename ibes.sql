select * from IBESInfo3 where Code =44217
--STicker, code
select * from IBESInfo3 where sticker in ('GILD', 'AMGN', 'BIIB', 'CELG', 'WBA', 'DTV', 'TWC', 'AAL', 'ALXN', 'REGN', 'VRTX', 'TEL', 'OMC', 'TYC', 'ES', 'HRB', 'NAVI', 'DISCK', 'ALLE', 'RIG', 'ESV', 'HCBK', 'NE')
select cusip, code,name, sticker from IBESInfo3 where  cusip in (
'37555810',
'03116210',
'09062X10',
'15102010',
'93142710',
'25490A30',
'88732J20',
'02376R10',
'01535110',
'75886F10',
'92532F10',
'H8498910',
'68191910',
'G9144210',
'30040W10',
'09367110',
'63938C10',
'25470F30',
'G0176J10',
'H8817H10',
'G3157S10',
'44368310',
'G6543110'



 )


select * from IBESInfo3 where name like 'ALLEGION%'

select * from IBESActL1  where Code=472 and FQDate = '20130630'
and date_ = (select min(Date_) from IBESActL1  where Code=2043 and FQDate = '20130930')

select * from ibesactl1 where date_=(select max(date_) from ibesactl1 where 
        code=(select code from ibesinfo3 where iticker='AKRN') and 
        measure=8 and date_ < '20150325') and code=(select code from ibesinfo3 where iticker='AKRN') and 
        measure=8 

select * from IBESPerCode where Flag='S'


declare @code numeric;
set @code = 9352;
declare @rdate date;
set @rdate = '20130731';
declare @fqdate date;
set @fqdate = (select MAX(fqdate) from IBESActL1 where FQDate <= @rdate and FQDate >= dateadd(D , -75, @rdate)
and Code=@code )
declare @ibdate date;
set @ibdate = (select MIN(date_) from IBESActL1 where FQdate  = @fqdate and	Code=@code )

--------
select Date_, FQDate , FQValue  from IBESActL1  where Code=@code and 
FQdate  = @fqdate and  Date_ = @ibdate
--------
select * from IBESEstL1  where Code=@code  and PerType = 2 and Measure = 8 and Period = 6 and PerDate=@fqdate 
and EstDate = (select max(EstDate) from IBESEstL1 where Code=@code  
               and PerType = 2 and Measure = 8 and Period = 6 and PerDate=@fqdate)
---------


select top 1 * from IBESEstL1  where code=9352 and PerType = 2 and Measure = 8 and Period = 6 and PerDate='20130630'
order by EstDate desc 


select A.FQDate, A.fqvalue , A.mdate, B.PerDate, B.mean , B.std, B.edate from 
(select FQDate, max(FQValue) as fqvalue, MAX(Date_) as mdate
      from IBESActL1 where code=9352 group by FQDate) A
 INNER JOIN 
 (select PerDate , max(Mean) as mean ,  max(StdDev) as std, MAX(EstDate) as edate
      from IBESEstL1  where code=9352 and PerType = 2 and Measure = 8 and Period = 6 
      group by PerDate ) B
      on A.FQDate = B.PerDate order by A.FQDate 
   
   
   
   
select * from IbSumRec where Code = 9352 and Date_ <= '20130718' and Date_ >= DATEADD()

select * from IbdRec where Code = 9352 order by RecDate 

select * from IBDRecCode order by Code 

select A.FQDate, A.fqvalue , A.mdate, B.PerDate, B.mean , B.std, B.edate
from(  select FQDate, FQValue as fqvalue, Date_ as mdate
	   from IBESActL1  a1 where code=9352 
	   and  Date_  = (SELECT Min(Date_) from IBESActL1  a2
					  where a1.code=a2.code	and a1.FQDate = a2.FQDate )
	   ) A 
	   
  INNER JOIN
    ( select PerDate , EstDate as edate , Mean as mean ,  StdDev as std
      from IBESEstL1 l1 where code=9352 and PerType = 2 and Measure = 8 and Period = 6
	  and  EstDate = (SELECT MAX(EstDate) FROM IBESEstL1 l2
                      WHERE l1.code=l2.code and l1.PerType = l2.PerType 
                      and l1.Measure = l2.Measure and l1.Period = l2.Period 
                      and l1.PerDate = l2.PerDate)	
	   ) B
       on A.FQDate = B.PerDate where A.FQDate < '20130731'
       order by A.FQDate


select * from IBeSInfo3 where name like 'East%Platin%'

select * from IBGSInfo3 where name like 'Shiseido%'

select top 10 * from gsecmstr where name like 'interoil%'
select top 10 * from secmstr where name like 'JAGUAR%MIN%' and type_=1

select SecCode from secmstr where sedol='BMNS9K' and Type_=1

select * from secmap where seccode='97954' and VenType =4 and rank=1
--select * from GSecMap where seccode='97954'
select * from ibgsinfo3 where code=22008
select * from IBGSInfo3 where name like 'novion%'
select * from IBESInfo3  where name like '%IVANHOE%'


select ITicker from ibgsinfo3 where 
    code=(select VenCode from secmap where 
    seccode=(select SecCode from secmstr where sedol='BMNS9K' and Type_=1)
    and VenType=4 and rank=1)


select  Date_, FYValue from ibgsactl1 where code=(select code from ibgsinfo3 where iticker = '@2JY') and date_ <= '2014-06-30'

select * from ibesinfo3 where iticker='PSRC'

select * from IBESActL1  where Code=2043