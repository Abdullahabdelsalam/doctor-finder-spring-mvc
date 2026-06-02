package com.abdullah.model;

public class Doctor {
    private int id;
    private String name;
    private String specialization;
    private String hospital;
    private double fees;
    private int experience;
    private String phone;

    public Doctor(){};

    public Doctor(int id,
                  String name,
                  String specialization,
                  String hospital,
                  double fees,
                  int experience,
                  String phone){
        this.id = id;
        this.name = name;
        this.specialization = specialization;
        this.hospital = hospital;
        this.fees = fees;
        this.experience = experience;
        this.phone = phone;

    }



    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSpecialization() {
        return specialization;
    }

    public void setSpecialization(String specialization) {
        this.specialization = specialization;
    }

    public String getHospital() {
        return hospital;
    }

    public void setHospital(String hospital) {
        this.hospital = hospital;
    }

    public double getFees() {
        return fees;
    }

    public void setFees(double fees) {
        this.fees = fees;
    }

    public int getExperience() {
        return experience;
    }

    public void setExperience(int experience) {
        this.experience = experience;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
