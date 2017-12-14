-- DS div data
select * from DS2Div where InfoCode=49350 --and EffectiveDate < '2011-11-30'

-------------------------------
-------------------------------
select DATEADD(M, -252, '20121231')

-- DS split data
select * from DS2Adj where InfoCode=60530 and AdjType =1
select MAX(AdjDate ) from DS2Adj where AdjDate <= '2011-09-14' and AdjType =1 and InfoCode=60530

-- ADJUST DATASTREAM DIVIDENDS FOR SPLITS & SPIN
SELECT	I.INFOCODE,
		DSCODE,
		DSQTNAME,
		EFFECTIVEDATE,
		AnnouncedDate ,
		ISOCurrCode,
		DIVRATE,
		ROUND(DIVRATE * CUMADJFACTOR, 3) [SPLTADJDIV]
FROM		DS2CTRYQTINFO I
	JOIN	DS2DIV D
ON		D.INFOCODE = I.INFOCODE
	JOIN	DS2ADJ A
ON		A.INFOCODE = D.INFOCODE
	AND	A.ADJDATE <= D.EFFECTIVEDATE
	AND	(A.ENDADJDATE >= D.EFFECTIVEDATE OR A.ENDADJDATE IS NULL)
	AND	A.ADJTYPE = 2	-- ADJUSTS FOR CORPORATE ACTIONS (SPLIT & SPIN)
WHERE	I.INFOCODE = 70097
and D.EffectiveDate >= DATEADD(m, -12, '20121130') and D.DivTypeCode in ('YR','QTR','MTH','HYR','INT', 'FIN')  
and D.EffectiveDate < '20121130'

select * from DS2Div where InfoCode = 70097

select dv.EffectiveDate, dv.AnnouncedDate, dv.ISOCurrCode, dv.DivRate, df.MidRate, dv.DivRate/df.MidRate  from Ds2Div dv, DS2FXRate df
where
dv.InfoCode=2652 and 
dv.EffectiveDate<='20120531' and
df.ExRateDate = ( select max( exRateDate) from DS2FXRate where ExRateDate <= dv.EffectiveDate and 
ExRateIntCode = df.ExRateIntCode) and 
dv.PaymentUnitFlag is NULL and
df.ExRateIntCode  = (select ExRateIntCode from DS2FXCode 
                     where FromCurrCode = dv.ISOCurrCode and ToCurrCode = 'USD' and
                     RateTypeCode = 'SPOT')
order by EffectiveDate desc
-------------------------------
-------------------------------

-- IDC US div type
select * from prccode2 where TYPE_=4 and code in (0,12,13, 31, 32, 53,76, 77, 160, 21, 51, 24)
select * from prccode2 where TYPE_=3 and code in (0,3,6, 7, 20, 15, 17, 23, 20)
-------------------------------
-------------------------------


--IDC US div data ------------ 
select *  from prc.PrcDiv where Code = 65466 and ExDate > '20061201'

select a.SeqCode, a.ExDate, a.AnnDate,
a.PayType,b.Desc_, a.SuppType, c.Desc_ , a.DivType , a.Rate, a.Currency_ 
from prc.PrcDiv a, PrcCode2 b, PrcCode2 c where
a.PayType = b.Code and b.Type_  = 4 and
a.SuppType  = c.Code and c.Type_  = 3 and
a.Code = 65466 and a.ExDate > '20061201' order by a.SeqCode 
-------------------------------

--IDC Global div data ------------ 
select *  from GPrcDiv where Code = 145862 --and DivType in(1) order by ExDate 
-------------------------------
-------------------------------

-- IDC Global div type
select * from GPrcCode  where TYPE_=78 --and code in (0,3,6, 7, 20, 15, 17, 23, 20)
-------------------------------
-------------------------------



-- IDC canada div data
select * from CPrcDiv where Code=720 and ExDate < '2011-11-30' and DivType = 1
-------------------------------
-------------------------------


-- IDC canada split data
select * from CPrcDiv where Code=720 and ExDate < '2011-11-30' and DivType = 2
-------------------------------
-------------------------------


