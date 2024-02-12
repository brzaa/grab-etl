-- create flat table on bgq
create or replace table fabled-web-406004.uber_etl_project.tbl_bq as (
select a.trip_id,a.VendorID,
b.tpep_pickup_datetime,b.tpep_dropoff_datetime,
c.passenger_count,
d.trip_distance,
e.rate_code_name,
g.pickup_longitude,g.pickup_latitude,
h.dropoff_longitude,h.dropoff_latitude,
i.payment_type_name,
a.fare_amount,
a.extra,
a.mta_tax,
a.tip_amount,
a.tolls_amount,
a.improvement_surcharge,
a.total_amount

from fabled-web-406004.uber_etl_project.fact_table a 
join fabled-web-406004.uber_etl_project.datetime_dim b on b.datetime_id = a.datetime_id
join fabled-web-406004.uber_etl_project.passenger_count_dim c on  c.passenger_count_id = a. passenger_count_id
join fabled-web-406004.uber_etl_project.trip_distance_dim d on  d.trip_distance_id = a. trip_distance_id
join fabled-web-406004.uber_etl_project.rate_code_dim e on e.rate_code_id = a. rate_code_id
join fabled-web-406004.uber_etl_project.pickup_location_dim g on g.pickup_location_id = a. pickup_location_id
join fabled-web-406004.uber_etl_project.dropoff_location_dim h on h.dropoff_location_id = a. dropoff_location_id
join fabled-web-406004.uber_etl_project.payment_type_dim i on i.payment_type_id = a. payment_type_id)