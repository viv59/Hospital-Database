--Select all records from the user table:
SELECT * from users;

-- Select the names and specialties of doctors along with their corresponding receptionist names:
SELECT d.dname, d.specialty, r.receptionist_name
FROM doctor d
JOIN receptionist r ON d.log_id = r.log_id;

-- Select the total number of patients in each room type:
SELECT room_type, COUNT(patient_id) AS patient_count
FROM room
LEFT JOIN patient ON room.room_id = patient.room_id
GROUP BY room_type;

--Retrieve the highest-paid receptionist
SELECT receptionist_name, salary
FROM receptionist
ORDER BY salary DESC
LIMIT 1;

-- Delete a specific receptionist by their ID and remove associated user record:
DELETE FROM receptionist WHERE receptionist_id = 1;
DELETE FROM users WHERE log_id = 2;

-- Update the room status for a specific room to 'Occupied':
UPDATE room SET room_status = 'Occupied' WHERE room_id = 1;

-- retrieve the patient details for the highest-paid receptionist:SELECT *
FROM patient
WHERE room_id = (
    SELECT room_id
    FROM receptionist
    ORDER BY salary DESC
    LIMIT 1
);

--find the average salary of nurses using WITH :
WITH NurseSalaries AS (
    SELECT salary
    FROM nurse
)
SELECT AVG(salary) AS average_salary
FROM NurseSalaries;


-- a view that displays the names and specialties of doctors:
CREATE VIEW DoctorInfo AS
SELECT d.dname, d.specialty
FROM doctor d;

-- query on GRANT
CREATE ROLE admin;
GRANT select ON DoctorInfo TO admin;
