-- Удалить животное
create or replace function delete_animal(id int) returns void
    language plpgsql
as
$$
begin
    delete from animal where animal_id = id;
end;
$$;

-- Добавить работника
create or replace function add_worker(name varchar(50), worker_position varchar(25)) returns void
    language plpgsql
as
$$
declare
    new_id int;
begin
    select max(worker_id) + 1 from worker into new_id;
    insert into worker values (new_id, name, worker_position);
end;
$$;

-- Работник берет задачу
create or replace function worker_get_task(wid int, tid int) returns void
    language plpgsql
as
$$
begin
    insert into worker_task values (wid, tid);
end;
$$;

-- Назначить работника ответсвенным за животное
create or replace function give_animal_to_worker(aid int, wid int) returns void
    language plpgsql
as
$$
begin
    update animal set worker_id = wid where animal_id = aid;
end;
$$;

-- Отметить как сломанный предмет инвентаря
create or replace function break_inventory(iid int) returns void
    language plpgsql
as
$$
begin
    update inventory set is_broken = true where inventory_id = iid;
end;
$$;

-- Добавить новый предмент инвентаря
create or replace function add_new_inventory(inv_price int, inv_type_id int, bid int) returns void
    language plpgsql
as
$$
declare
    new_id int;
begin
    select max(inventory_id) + 1 from inventory into new_id;
    insert into inventory values (new_id, inv_price, false, inv_type_id, bid);
end;
$$;

-- Обновить цену на продукт
create or replace function update_price(pid int, new_price int) returns void
    language plpgsql
as
$$
begin
    update product set price = new_price where product_id = pid;
end;
$$;

-- Добавить задачу
create or replace function add_task(descr varchar(200)) returns void
    language plpgsql
as
$$
declare
    new_id int;
begin
    select max(task_id) + 1 from task into new_id;
    insert into task values (new_id, descr, false);
end;
$$;
