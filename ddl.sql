use Medisistema;

use Medisistema;

create table if not exists empleados(
n_cod int auto_increment not null primary key,
titular_id int not null,
internos_id int not null,
sustitutos_id int not null,
horario enum('Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes', 'Sabado', 'Domingo') not null,
periodo_desc enum('Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre') not null,
foreign key(titular_id) references medico(id),
foreign key(internos_id) references medico(id),
foreign key(sustitutos_id) references medico(id)
);



select * from empleados;

alter table medico add horas int not null;

update medico set horas = 5 where id in (3, 6, 9);
update medico set horas = 8 where id in (1, 2, 4);
update medico set horas = 18 where id in (5, 7, 8);
update medico set horas = 12 where id = 10;

create table if not exists registro_vac (
cod int auto_increment primary key,
id_medico int not null,
fecha date,
dias int not null,
foreign key(id_medico) references medico(id)
);

