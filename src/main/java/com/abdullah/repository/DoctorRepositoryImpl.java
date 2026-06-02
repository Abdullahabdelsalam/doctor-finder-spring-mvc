package com.abdullah.repository;

import com.abdullah.model.Doctor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import java.util.List;


@Repository
public class DoctorRepositoryImpl implements DoctorRepository {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public void save(Doctor doctor) {

        String sql =
                "INSERT INTO doctor " +
                        "(name, specialization, hospital, fees, experience, phone) " +
                        "VALUES (?, ?, ?, ?, ?, ?)";

        jdbcTemplate.update(sql,
                doctor.getName(),
                doctor.getSpecialization(),
                doctor.getHospital(),
                doctor.getFees(),
                doctor.getExperience(),
                doctor.getPhone()
        );
    }

    @Override
    public List<Doctor> findAll() {

        String sql = "SELECT * FROM doctor";

        return jdbcTemplate.query(sql, (rs, rowNum) -> {

            Doctor doctor = new Doctor();

            doctor.setId(rs.getInt("id"));
            doctor.setName(rs.getString("name"));
            doctor.setSpecialization(rs.getString("specialization"));
            doctor.setHospital(rs.getString("hospital"));
            doctor.setFees(rs.getDouble("fees"));
            doctor.setExperience(rs.getInt("experience"));
            doctor.setPhone(rs.getString("phone"));

            return doctor;
        });
    }


    public Doctor findById(int id) {

        String sql = "SELECT * FROM doctor WHERE id=?";

        return jdbcTemplate.queryForObject(sql,
                new Object[]{id},
                (rs, rowNum) -> {

                    Doctor doctor = new Doctor();

                    doctor.setId(rs.getInt("id"));
                    doctor.setName(rs.getString("name"));
                    doctor.setSpecialization(rs.getString("specialization"));
                    doctor.setHospital(rs.getString("hospital"));
                    doctor.setFees(rs.getDouble("fees"));
                    doctor.setExperience(rs.getInt("experience"));
                    doctor.setPhone(rs.getString("phone"));

                    return doctor;
                });
    }

    public void updateDoctor(Doctor doctor) {

        String sql = "UPDATE doctor SET name=?, phone=?, specialization=?, hospital=?, fees=?, experience=? WHERE id=?";

        jdbcTemplate.update(sql,
                doctor.getName(),
                doctor.getPhone(),
                doctor.getSpecialization(),
                doctor.getHospital(),
                doctor.getFees(),
                doctor.getExperience(),
                doctor.getId());
    }

    public void delete(int id) {

        String sql =
                "DELETE FROM doctor WHERE id=?";

        jdbcTemplate.update(sql, id);
    }

    public List<Doctor> findBySpecialization(
            String specialization) {

        String sql =
                "SELECT * FROM doctor " +
                        "WHERE specialization LIKE ?";

        return jdbcTemplate.query(
                sql,
                new Object[]{"%" + specialization + "%"},
                (rs, rowNum) -> {

                    Doctor doctor = new Doctor();

                    doctor.setId(rs.getInt("id"));
                    doctor.setName(rs.getString("name"));
                    doctor.setSpecialization(
                            rs.getString("specialization"));
                    doctor.setHospital(
                            rs.getString("hospital"));
                    doctor.setFees(
                            rs.getDouble("fees"));
                    doctor.setExperience(
                            rs.getInt("experience"));
                    doctor.setPhone(
                            rs.getString("phone"));

                    return doctor;
                });
    }
}
