package com.medicalcenter.controller.doctorControllers;

import com.medicalcenter.dao.PatientDAO;
import com.medicalcenter.dao.PrescriptionDAO;
import com.medicalcenter.dao.MedicalRecordDAO;
import com.medicalcenter.dao.DoctorDAO;
import com.medicalcenter.model.Patient;
import com.medicalcenter.model.Prescription;
import com.medicalcenter.model.MedicalRecord;
import com.medicalcenter.model.Doctor;
import com.medicalcenter.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/doctor/prescriptions/new")
public class DoctorNewPrescriptionServlet extends HttpServlet {
    
    private PatientDAO patientDAO;
    private PrescriptionDAO prescriptionDAO;
    private MedicalRecordDAO medicalRecordDAO;
    private DoctorDAO doctorDAO;
    
    @Override
    public void init() throws ServletException {
        patientDAO = new PatientDAO();
        prescriptionDAO = new PrescriptionDAO();
        medicalRecordDAO = new MedicalRecordDAO();
        doctorDAO = new DoctorDAO();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        
        // Check if user is logged in and is a doctor
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        
        User user = (User) session.getAttribute("user");
        
        if (!"doctor".equals(user.getRole())) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        
        try {
            // Get doctor information
            Doctor doctor = doctorDAO.getDoctorByUserId(user.getId());
            
            if (doctor == null) {
                request.setAttribute("errorMessage", "Profil médecin non trouvé.");
                request.getRequestDispatcher("/WEB-INF/views/error.jsp").forward(request, response);
                return;
            }
            
            // Get patient ID from request
            String patientIdParam = request.getParameter("patientId");
            if (patientIdParam == null || patientIdParam.isEmpty()) {
                request.setAttribute("errorMessage", "ID patient manquant.");
                request.getRequestDispatcher("/WEB-INF/views/error.jsp").forward(request, response);
                return;
            }
            
            int patientId;
            try {
                patientId = Integer.parseInt(patientIdParam);
            } catch (NumberFormatException e) {
                request.setAttribute("errorMessage", "ID patient invalide.");
                request.getRequestDispatcher("/WEB-INF/views/error.jsp").forward(request, response);
                return;
            }
            
            // Get patient information
            Patient patient = patientDAO.getPatientById(patientId);
            if (patient == null) {
                request.setAttribute("errorMessage", "Patient non trouvé.");
                request.getRequestDispatcher("/WEB-INF/views/error.jsp").forward(request, response);
                return;
            }
            
            // Set attributes for JSP
            session.setAttribute("user", user);
            session.setAttribute("doctor", doctor);
            session.setAttribute("patient", patient);
            
            // Forward to the new prescription JSP
            response.sendRedirect(request.getContextPath() + "/doctor/doctor-new-prescription.jsp");
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Une erreur est survenue: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/views/error.jsp").forward(request, response);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        
        // Check if user is logged in and is a doctor
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        
        User user = (User) session.getAttribute("user");
        
        if (!"doctor".equals(user.getRole())) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        
        try {
            // Get doctor information
            Doctor doctor = doctorDAO.getDoctorByUserId(user.getId());
            
            // Get form parameters
            String patientIdParam = request.getParameter("patientId");
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            String expiryDateParam = request.getParameter("expiryDate");
            String notes = request.getParameter("notes");
            
            // Validate required fields
            if (patientIdParam == null || title == null || description == null || 
                patientIdParam.trim().isEmpty() || title.trim().isEmpty() || description.trim().isEmpty()) {
                request.setAttribute("errorMessage", "Tous les champs obligatoires doivent être remplis.");
                doGet(request, response);
                return;
            }
            
            int patientId = Integer.parseInt(patientIdParam);
            Patient patient = patientDAO.getPatientById(patientId);
            
            // Get or create active medical record for the patient
            MedicalRecord activeRecord = medicalRecordDAO.getActiveMedicalRecordByPatientId(patientId);
            if (activeRecord == null) {
                // Create a new medical record
                activeRecord = new MedicalRecord(patient);
                medicalRecordDAO.saveMedicalRecord(activeRecord);
            }
            
            // Create new prescription
            Prescription prescription = new Prescription(activeRecord, doctor, description);
            prescription.setTitle(title);
            
            // Set expiry date if provided
            if (expiryDateParam != null && !expiryDateParam.trim().isEmpty()) {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                Date expiryDate = sdf.parse(expiryDateParam);
                prescription.setExpiryDate(expiryDate);
            }
            
            // Save prescription
            prescriptionDAO.savePrescription(prescription);
            activeRecord.addPrescription(prescription);
            medicalRecordDAO.updateMedicalRecord(activeRecord);
            // Set success message
            request.setAttribute("successMessage", "Ordonnance créée avec succès pour " + patient.getFullName());
            
            // Redirect to appointments page
            response.sendRedirect(request.getContextPath() + "/doctor/appointments?success=prescription_created");
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Une erreur est survenue lors de la création de l'ordonnance: " + e.getMessage());
            doGet(request, response);
        }
    }
}
