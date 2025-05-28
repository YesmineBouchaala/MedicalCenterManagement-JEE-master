package com.medicalcenter.service;

import com.medicalcenter.dao.MedicalRecordDAO;
import com.medicalcenter.model.MedicalRecord;

import java.util.Collection;
import java.util.List;

public class MedicalRecordService {
    private MedicalRecordDAO medicalRecordDAO;
    public MedicalRecordService() {
        medicalRecordDAO = new MedicalRecordDAO();
    }


    public List<MedicalRecord> getMedicalRecordsByPatientID(int patientID) {
        return medicalRecordDAO.getMedicalRecordsByPatientId(patientID);
    }

    public MedicalRecord getActiveMedicalRecordByPatientId(int id) {
        return medicalRecordDAO.getActiveMedicalRecordByPatientId(id);
    }
}
