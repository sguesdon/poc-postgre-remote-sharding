do $$
begin
for r in 1..10000 loop
    insert into temperature(city_id, timestamp, temp)
    values(MOD(r, 10), '2021-06-20', 1);
end loop;
end;
$$;
