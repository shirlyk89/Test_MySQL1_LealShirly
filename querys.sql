use Medisistema;

-- 1. Numero de pacientes atendidos por cada medico 

select count(num_pacientes) from (select m.id_paciente as num_pacientes, m.id from medico m inner join paciente P on m.id_paciente = P.id_paciente  ) as total_por_medico; 

-- 2. Total de dias de vacaciones planificadas y disfrutadas por cada empleado

select v.dias, m.id, v.fecha, m.nombre from registro_vac v  inner join medico m on v.id_medico = m.id;

-- 3. Medicos con mayor cantidad de horas de consulta en la semana

select m.id, (select max(hour(fecha)) from citas c inner join medico m  where c.id_medico = m.id) from medico m ;

-- 4. Numero de sustituciones realizadas por cada medico sustituto



-- 5. Numero de medicos que estan actualmente en la institucion

select g.id_m, g.cargo, m.nombre from gestion_personal g inner join medico m on g.id_m = m.id;

-- 6. Horas totales de consulta por medico por dia de la semana 

select id, sum(m.horas) from medico m inner join empleados e  where 

-- 7. Medico con mayor cantidad de pacientes asignados

-- 8. Empleados con mas de 10 dias de vacaciones disfrutadas

select v.dias, e.titular_id, e.internos_id, e.sustitutos_id from registro_vac v inner join empleados e where v.dias > 10; 

-- 9. 	Medicos que actualmente estan realizando una sustitucion

select e.sustitutos_id as 'medicos sustitutos', m.id, m.nombre from empleados e inner join medico m where e.sustitutos_id = m.id;

-- 10. Total de dias de vacaciones planificadas y disfrutadas por cada tipo de empleado.



-- 11. Total de pacientes por cada tipo de medico

-- 12. Numero de sustituciones por tipo de medico

-- 13. Total de pacientes por médico y por especialidad.


-- 14. Empleados y médicos con más de 20 días de vacaciones planificadas.


-- 15. Total de horas de consulta por especialidad y día de la semana.