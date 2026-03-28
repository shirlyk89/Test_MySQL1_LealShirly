use Medisistema;

-- 1. Numero de pacientes atendidos por cada medico 

SELECT c.id_medico, COUNT(DISTINCT c.id_paciente) AS pacientes_atendidos FROM citas c WHERE c.estado = 'Completada' GROUP BY c.id_medico; 

-- 2. Total de dias de vacaciones planificadas y disfrutadas por cada empleado

SELECT id_medico, SUM(CASE 
        WHEN fecha > CURDATE() 
        THEN 1 
        ELSE 0 
    END) AS dias_planificados,

    SUM(CASE 
        WHEN fecha < CURDATE() 
        THEN 1 
        ELSE 0 
    END) AS dias_disfrutados

FROM registro_vac
GROUP BY id_medico;

-- 3. Medicos con mayor cantidad de horas de consulta en la semana

SELECT 
    id_medico,
    COUNT(m.horas) AS horas_consulta
FROM citas c inner join medico m on c.id_medico = m.id
WHERE estado = 'Completada'
AND YEARWEEK(fecha, 1) = YEARWEEK(CURDATE(), 1)
GROUP BY id_medico
ORDER BY horas_consulta DESC;

-- 4. Numero de sustituciones realizadas por cada medico sustituto

SELECT 
    sustitutos_id,
    COUNT(*) AS total_sustituciones
FROM empleados
WHERE sustitutos_id IS NOT NULL
GROUP BY sustitutos_id;

-- 5. Numero de medicos que estan actualmente en la institucion

SELECT COUNT(DISTINCT id_medico) AS total_medicos
FROM (
    SELECT titular_id AS id_medico FROM empleados
    UNION
    SELECT internos_id FROM empleados
    UNION
    SELECT sustitutos_id FROM empleados
) AS medicos;

-- 6. Horas totales de consulta por medico por dia de la semana 

SELECT 
    id_medico,
    DAYNAME(fecha) AS dia_semana,
    COUNT(*) AS horas_consulta
FROM citas
WHERE estado = 'Completada'
GROUP BY id_medico, dia_semana
ORDER BY id_medico, horas_consulta DESC;

-- 7. Medico con mayor cantidad de pacientes asignados

SELECT 
    id_medico,
    COUNT(DISTINCT id_paciente) AS total_pacientes
FROM citas
GROUP BY id_medico
ORDER BY total_pacientes DESC
LIMIT 1;

-- 8. Empleados con mas de 10 dias de vacaciones disfrutadas

SELECT 
    id_medico,
    COUNT(*) AS dias_disfrutados
FROM registro_vac 
WHERE fecha <= CURDATE()
GROUP BY id_medico
HAVING COUNT(*) > 10;

-- 9. 	Medicos que actualmente estan realizando una sustitucion

select e.sustitutos_id as 'medicos sustitutos', m.id, m.nombre from empleados e inner join medico m where e.sustitutos_id = m.id;


-- 10. Total de dias de vacaciones planificadas y disfrutadas por cada tipo de empleado.

SELECT DISTINCT sustitutos_id
FROM empleados
WHERE sustitutos_id IS NOT NULL;

-- 11. Total de pacientes por cada tipo de medico

SELECT 
    'Titular' AS tipo_medico,
    COUNT(DISTINCT c.id_paciente) AS total_pacientes
FROM citas c
JOIN empleados e ON c.id_medico = e.titular_id

UNION

SELECT 
    'Interno',
    COUNT(DISTINCT c.id_paciente)
FROM citas c
JOIN empleados e ON c.id_medico = e.internos_id

UNION

SELECT 
    'Sustituto',
    COUNT(DISTINCT c.id_paciente)
FROM citas c
JOIN empleados e ON c.id_medico = e.sustitutos_id;


-- 12. Numero de sustituciones por tipo de medico

SELECT 
    'Titular' AS tipo_medico,
    COUNT(*) AS total_sustituciones
FROM empleados
WHERE sustitutos_id IS NOT NULL

UNION

SELECT 
    'Interno',
    COUNT(*)
FROM empleados
WHERE sustitutos_id IS NOT NULL
AND internos_id IS NOT NULL

UNION

SELECT 
    'Sustituto',
    COUNT(*)
FROM empleados
WHERE sustitutos_id IS NOT NULL;


-- 13. Total de pacientes por médico y por especialidad.

SELECT 
    id_medico,
    tipo_especialidad,
    COUNT(DISTINCT id_paciente) AS total_pacientes
FROM citas
GROUP BY id_medico, tipo_especialidad;


-- 14. Empleados y médicos con más de 20 días de vacaciones planificadas.
SELECT 
    id_medico,
    COUNT(*) AS dias_planificados
FROM registro_vac rv 
WHERE fecha > CURDATE()
GROUP BY id_medico
HAVING COUNT(*) > 20;

-- 15. Total de horas de consulta por especialidad y día de la semana.

SELECT 
    tipo_especialidad,
    DAYNAME(fecha) AS dia_semana,
    COUNT(*) AS horas_consulta
FROM citas
WHERE estado = 'Completada'
GROUP BY tipo_especialidad, dia_semana
ORDER BY tipo_especialidad, horas_consulta DESC;