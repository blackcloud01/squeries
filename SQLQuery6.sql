
     
  SELECT DISTINCT
            spc.source_id,
            co1.id AS supplier_id,
            tfs.fs_entity_id AS supplier_fds_id,
                co1.name AS supplier,
                co1.ticker AS supplier_ticker,
                co1.home_region AS supplier_domicile,
                spc.revenue_percent,
            co2.id AS customer_id,
            sfs.fs_entity_id AS customer_fds_id,
                co2.name AS customer_name,
                co2.ticker AS customer_ticker,
                co2.home_region AS customer_domicile,
				spc.*
        FROM
            [LiveData].[dbo].[supply_chain] spc WITH (NOLOCK) INNER JOIN
            [LiveData].[dbo].[company] co1 WITH (NOLOCK) ON (
                co1.id = spc.supplier_id AND
                        co1.start$ <= '2004-01-01' AND
                co1.end$ > '2004-01-01' 
            ) INNER JOIN
            [LiveData].[dbo].[company_factset] tfs WITH (NOLOCK) ON (
                tfs.company_id = co1.id AND
                tfs.pri = 'Y' AND
                        tfs.start$ <= '2004-01-01' AND
                tfs.end$ > '2004-01-01'

            ) INNER JOIN
            [LiveData].[dbo].[company] co2 WITH (NOLOCK) ON (
                co2.id = spc.customer_id AND
                        co2.start$ <= '2004-01-01' AND
                co2.end$ > '2004-01-01'
            ) INNER JOIN
            [LiveData].[dbo].[company_factset] sfs WITH (NOLOCK) ON (
                sfs.company_id = co2.id AND
                sfs.pri = 'Y' AND
                        sfs.start$ <= '2004-01-01' AND
                sfs.end$ > '2004-01-01'
            )
        WHERE
            --Uncomment below line to filter for non US domiciled customers/suppliers
            --(co1.home_region != 'US' OR co2.home_region != 'US') AND
            --spc.revenue_percent > '0' AND -- Use this to filter for relationships with revenue exposure
            spc.end$ = '4000-01-01' AND (
                    -- Uncomment below if checking for relationship between two companies using Revere IDs
                    --(spc.supplier_id = '3769' AND customer_id = '10241') OR
                    --(spc.supplier_id = '10241' AND customer_id = '3769')
                    (tfs.fs_entity_id = '00375R-E' AND sfs.fs_entity_id = '000KYC-E') OR
                    (tfs.fs_entity_id = '000KYC-E' AND sfs.fs_entity_id = '00375R-E')
                )