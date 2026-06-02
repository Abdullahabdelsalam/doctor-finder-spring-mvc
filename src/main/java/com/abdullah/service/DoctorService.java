package com.abdullah.service;

import com.abdullah.model.Doctor;
import com.abdullah.repository.DoctorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class DoctorService {

//    private List<Doctor> doctors = new ArrayList<>();
    @Autowired
    private DoctorRepository doctorRepository;
   // Validate Doctor
    private void validateDoctor(Doctor doctor) {
        if (doctor == null) {
            throw new IllegalArgumentException("Doctor cannot be null");
        }

        if (doctor.getName() == null || doctor.getName().trim().isEmpty()) {
            throw new IllegalArgumentException("Doctor name is required");
        }

//        if (doctor.getFees() == null) {
//            throw new IllegalArgumentException("Fees is required");
//        }

        if (doctor.getFees() < 0) {
            throw new IllegalArgumentException("Fees cannot be negative");
        }

        if (doctor.getExperience() < 0) {
            throw new IllegalArgumentException("Experience cannot be negative");
        }

        if (doctor.getPhone() == null || !doctor.getPhone().matches("[0-9]{11}")) {
            throw new IllegalArgumentException("Phone must be 11 digits");
        }
    }

    // save Doctor
    public void saveDoctor(Doctor doctor) {
        validateDoctor(doctor);
        doctorRepository.save(doctor);
    }

    // get all doctor
    public List<Doctor> getAllDoctors(){
        return doctorRepository.findAll();
    }

    public Doctor getDoctorById(int id) {
        return doctorRepository.findById(id);
    }

    public void updateDoctor(Doctor doctor) {
        doctorRepository.updateDoctor(doctor);
    }

    public void deleteDoctor(int id) {

        doctorRepository.delete(id);
    }

    public List<Doctor> searchDoctor(
            String specialization) {

        return doctorRepository
                .findBySpecialization(specialization);
    }

}
