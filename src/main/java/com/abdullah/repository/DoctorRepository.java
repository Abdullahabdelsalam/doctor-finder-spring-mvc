package com.abdullah.repository;

import com.abdullah.model.Doctor;

import java.util.List;

public interface DoctorRepository {

    void save(Doctor doctor);
    List<Doctor> findAll();

    Doctor findById(int id);

    void updateDoctor(Doctor doctor);

    void delete(int id);

    List<Doctor> findBySpecialization(String specialization);
}
