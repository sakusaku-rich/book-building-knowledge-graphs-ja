RETURN apoc.date.convert(datetime().epochSeconds, 'seconds', 'days') AS outputInDays
