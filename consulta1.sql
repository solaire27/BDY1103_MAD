--ver la cantidad de eventos hechos en una determinada localización por cierta productora
select  r.NOMBRE, p.NOMBRE_FANTASIA, count(r.RECINTO_ID) from evento e
join productora p on p.PRODUCTORA_ID=e.productora_id
join RECINTO r on r.RECINTO_ID=e.RECINTO_ID
group by r.NOMBRE, p.NOMBRE_FANTASIA
order by p.NOMBRE_FANTASIA;

declare
    cursor c_cantidad_Eventos is select r.NOMBRE as "nombre recinto",
    p.NOMBRE_FANTASIA as "nombre productora", count(r.RECINTO_ID) as "cantidad eventos" 
    from evento e
    join productora p on p.PRODUCTORA_ID=e.productora_id
    join RECINTO r on r.RECINTO_ID=e.RECINTO_ID
    group by r.NOMBRE, p.NOMBRE_FANTASIA
    order by p.NOMBRE_FANTASIA;
    v_nombre_productora VARCHAR2(120);
    v_nombre_Recinto VARCHAR2(150);
    
    v_cantidad_Eventos NUMBER;
BEGIN
    open c_cantidad_Eventos;
    LOOP 
        fetch c_cantidad_Eventos into v_nombre_Recinto, v_nombre_productora, v_cantidad_Eventos;
        exit WHEN c_cantidad_Eventos%notfound;
        DBMS_OUTPUT.PUT_LINE('Nombre productora: '||v_nombre_productora);
        DBMS_OUTPUT.PUT_LINE('Nombre recinto: '||v_nombre_Recinto);
        DBMS_OUTPUT.PUT_LINE('Cantidad eventos: '||v_cantidad_Eventos);
    end loop;
    CLOSE c_cantidad_Eventos;
end;
