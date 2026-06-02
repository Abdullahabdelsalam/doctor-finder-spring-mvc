package com.abdullah.controller;

import com.abdullah.model.Doctor;
import com.abdullah.service.DoctorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;



@Controller
public class DoctorController {

    @Autowired
    private DoctorService doctorService;

    @GetMapping("/addDoctor")
    public String addDoctorPage() {

        return "add-doctor";
    }

    @PostMapping("/saveDoctor")
    public String saveDoctor(
            @ModelAttribute Doctor doctor) {
        doctorService.saveDoctor(doctor);
        return "success";
    }

    @GetMapping("/doctors")
    public String getDoctors(Model model) {

        List<Doctor> doctors = doctorService.getAllDoctors();

        model.addAttribute("doctors", doctors);

        return "doctor-list";
    }

    @GetMapping("/editDoctor/{id}")
    public String editDoctor(@PathVariable("id") int id, Model model) {
        Doctor doctor = doctorService.getDoctorById(id);
        model.addAttribute("doctor", doctor);
        return "edit-doctor";
    }

    @PostMapping("/updateDoctor")
    public String updateDoctor(@ModelAttribute Doctor doctor) {

        doctorService.updateDoctor(doctor);

        return "redirect:/doctors";
    }

    @GetMapping("/deleteDoctor/{id}")
    public String deleteDoctor(
            @PathVariable("id") int id) {

        doctorService.deleteDoctor(id);

        return "redirect:/doctors";
    }


    @GetMapping("/searchDoctor")
    public String searchDoctor(
            @RequestParam(value = "specialization", required = false) String specialization,
            Model model) {

        List<Doctor> doctors =
                doctorService.searchDoctor(specialization);

        model.addAttribute("doctors", doctors);

        return "doctor-list";
    }

}
