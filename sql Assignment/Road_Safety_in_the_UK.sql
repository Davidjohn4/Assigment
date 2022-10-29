
-- 1. Evaluate the median severity value of accidents caused by various Motorcycles.
select row_number() over(partition by vt.vehicle_type order by a.accident_severity) as rn,
 a.*,v.*,vt.* from accident a
left join vechiles v on v.accident_index=a.accident_index
left join vechile_types vt on vt.vehicle_code=v.vehicle_type
where 
vt.vehicle_type like 'motorcycle%' 
limit 0,200;




-- 2. Evaluate Accident Severity and Total Accidents per Vehicle Type
SELECT vt.vehicle_type, a.accident_severity,count(vt.vehicle_type) as total_accidents
FROM accident a
JOIN vechiles v ON a.accident_index = v.accident_index
JOIN vechile_types vt ON v.vehicle_type = vt.vehicle_code
GROUP BY 1
ORDER BY 2,3;

-- 3. Calculate the Average Severity by vehicle type.
 SELECT vt.vehicle_type, avg(a.accident_severity) as average_severity,count(vt.vehicle_type) as total_accidents
FROM accident a
JOIN vechiles v ON a.accident_index = v.accident_index
JOIN vechile_types vt ON v.vehicle_type = vt.vehicle_code
GROUP BY vt.vehicle_type
ORDER BY a.accident_severity,vt.vehicle_type;

-- 4. Calcullate the average Accident Severity and Total Accidents by motorcycle

select avg(a.accident_severity) as average_severity,count(vt.VECHILE_TYPE) as total_accidents
from accident a
JOIN vechiles v ON a.accident_index = v.accident_index
JOIN vechile_types vt ON v.VECHILE_TYPE = vt.VECHILE_CODE
group by vt.VECHILE_TYPE

