<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Assessments extends Admin_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('Model_assessment');
        $this->load->library('upload');
        $this->load->helper(array('form', 'url'));
        $this->not_logged_in();
    }

    public function index()
    {
        // Fetch subjects from the model
        $this->data['subjects'] = $this->Model_assessment->get_subjectName();

        // Render the template with the data
        $this->render_template('assessments/index', $this->data);
    }

    // public function save_assessment()
    // {
    //     $this->load->library('upload');
    //     $this->load->model('Model_assessment');





    //     // // File upload configuration
    //     $config['upload_path'] = './uploads';
    //     $config['allowed_types'] = 'pdf|doc|docx|csv|xlsx';
    //     $config['max_size'] = 2048; // 2MB

    //     // Load and initialize the upload library
    //     $this->load->library('upload', $config);
    //     $this->upload->initialize($config);

    //     // Initialize file path as null
    //     $file_path = null;

    //     // Handle file upload
    //     if ($this->upload->do_upload('file')) {

    //         // If file uploaded successfully
    //         $uploadData = $this->upload->data();
    //         $file_path = $uploadData['file_name']; // Extract file path


    //     } else {
    //         // Log upload errors for debugging
    //         $error = $this->upload->display_errors();
    //         log_message('error', 'File upload error: ' . $error);
    //     }

    //     // Collect form data
    //     $data = array(
    //         'project' => $this->input->post('project_id'),
    //         'course' => $this->input->post('course_id'),
    //         'subject' => $this->input->post('subject'),
    //         'assignment_type' => $this->input->post('assignment_type'),
    //         'assignment_marks' => $this->input->post('assignment_marks'),
    //         'passing_marks' => $this->input->post('passing_marks'),
    //         'date' => $this->input->post('date'),
    //         'faculty' => $this->input->post('faculty_id'),
    //         'file_path' => $file_path,
    //     );


    //     // Debug: Log the $data array for troubleshooting
    //     log_message('debug', 'Data before database insert: ' . print_r($data, true));

    //     // Insert data into the database
    //     if ($this->Model_assessment->save_assessment($data)) {
    //         $this->session->set_flashdata('success', 'Assessment created successfully!');
    //         redirect('Assessments');
    //     } else {
    //         $this->session->set_flashdata('error', 'Failed to create assessment.');
    //         redirect('Assessments/create'); // Adjust redirect as needed
    //     }
    // }




    //added by Raj
    public function addenquirybulk()
    {

        $this->form_validation->set_rules('project_id', 'Project Id', 'trim|required');
        $this->form_validation->set_rules('course_id', 'Course Id', 'trim|required');
        $this->form_validation->set_rules('assignment_type', 'assignment_type', 'trim|required');
        $this->form_validation->set_rules('assignment_marks', 'assignment_marks Date', 'trim|required');
        $this->form_validation->set_rules('passing_marks', 'passing_marks', 'trim|required');
        $this->form_validation->set_rules('date', 'date', 'trim|required');
        $this->form_validation->set_rules('faculty_id', 'faculty_id', 'trim|required');


        if ($this->form_validation->run() == TRUE) {

            $fileFieldName = "csvfile";

            if ($this->validateFormFile($fileFieldName)) {
                if ($_FILES[$fileFieldName]["type"] == "text/csv") {
                    $file = fopen($_FILES[$fileFieldName]["tmp_name"], "r");
                    $i = 0;
                    $isValid = false;
                    $isUpdated = false;
                    while (($getData = fgetcsv($file, 10000, ",")) !== FALSE) {


                        if (sizeof($getData) != 6)
                            break;

                        if ($i != 0 && $isValid) {
                            $pid = $this->input->post('project_id');
                            $cid = $this->input->post('course_id');
                            $cnsid = $this->input->post('counseller_id');
                            $status = $this->input->post('status');
                            $date = $this->input->post('date');



                            $stdName = $getData[0];    //it show header title in csv file
                            $stdMobile = $getData[1];
                            $stdEmail = $getData[2];
                            $address = $getData[3];
                            $qualification = $getData[4];
                            $specialization = $getData[5];


                            if (!empty($stdName) && !empty($stdMobile) && !empty($stdEmail) && !empty($address) && !empty($qualification) && !empty($specialization)) {
                                $data = array(
                                    'project_id' => $pid,
                                    'course_id' => $cid,
                                    'status' => $status,
                                    'counseller_id' => $cnsid,
                                    'student_name' => $stdName,
                                    'student_email' => $stdEmail,
                                    'student_mobile' => $stdMobile,
                                    'student_address' => $address,
                                    'qualification' => $qualification,
                                    'specialization' => $specialization,

                                    'created_at' => (new DateTime($date))->format("Y/m/d H:i:s"),
                                    'added_by' => $this->userId
                                );


                                $this->model_enquiry->create($data);

                                $isUpdated = true;
                            }
                        } else {
                            $stdName = trim($getData[0]);
                            $stdMobile = trim($getData[1]);
                            $stdEmail = trim($getData[2]);
                            $address = trim($getData[3]);
                            $qualification = trim($getData[4]);
                            $specialization = trim($getData[5]);
                            if ($stdName == "Student Name" && $stdMobile == "Student Mobile" && $stdEmail == "Student Email" && $address == "Address" && $qualification == "Highest Qualification" && $specialization == "Specialization" && $collegeName == "College name" && $remark == "Remark" && $gender == "Gender")
                                $isValid = true;
                        }
                        $i++;


                        // echo "<pre>";
                        // print_r($getData);
                        // echo "<pre>";
                    }
                    //die();
                    if ($isUpdated) {
                        $this->session->set_flashdata('success', 'Enquiry created Successfully!!');
                        redirect('screeningtest/manage', 'refresh');
                    } else {
                        $this->session->set_flashdata('error', 'Unable to submit the enquiry!!');
                        redirect('enquiry/manage', 'refresh');
                    }
                } else {
                    $this->session->set_flashdata('error', 'Invalid file selected, Please selecte CSV file only!');
                    redirect('enquiry/manage', 'refresh');
                }
            } else {
                $this->session->set_flashdata('error', 'Please select file!!');
                redirect('enquiry/manage', 'refresh');
            }
        } else {
            redirect('enquiry/manage', 'refresh');
        }
    }


    // read bulk file 
    public function submitBulkEquiry()
    {
        $this->form_validation->set_rules('project_id', 'Project Id', 'trim|required');
        $this->form_validation->set_rules('course_id', 'Course Id', 'trim|required');
        $this->form_validation->set_rules('subject', 'subject', 'trim|required');
        $this->form_validation->set_rules('assignment_type', 'assignment_type', 'trim|required');
        $this->form_validation->set_rules('assignment_marks', 'assignment_marks Date', 'trim|required');
        $this->form_validation->set_rules('passing_marks', 'passing_marks', 'trim|required');
        $this->form_validation->set_rules('date', 'date', 'trim|required');
        $this->form_validation->set_rules('faculty_id', 'faculty_id', 'trim|required');

        $fileFieldName = "csvFile";

        if ($this->validateFormFile($fileFieldName)) {
            // print_r("hii");
            // die();

            print_r($fileFieldName);
            die();
            if ($_FILES[$fileFieldName]["type"] == "text/csv") {
                $file = fopen($_FILES[$fileFieldName]["tmp_name"], "r");
                $i = 0;

                $isValid = false;
                $isUpdated = false;

                while (($getData = fgetcsv($file, 10000, ",")) !== FALSE) {
                    if (sizeof($getData) != 20)
                        break;
                    if ($i != 0 && $isValid) {
                        $enqId = $getData[0];
                        $enqData = $this->model_enquiry->getEnquiryDataByIdForScreeningTest($enqId);

                        if ($enqData != null) {
                            $aptiDate = $getData[14];
                            $aptiMarks = $getData[15];
                            $gdDate = $getData[16];
                            $gdMarks = $getData[17];
                            $totalMarks = $getData[18];
                            $status = $getData[19];

                            if (!empty($enqId) && !empty($aptiDate) && !empty($aptiMarks) && !empty($gdDate) && !empty($gdMarks) && !empty($totalMarks) && in_array($status, array(0, 1))) {
                                $data = array(
                                    'enquiry_id' => $enqId,
                                    'apptitude_test_date' => $aptiDate,
                                    'apptitude_test_marks' => $aptiMarks,
                                    'gd_date' => $gdDate,
                                    'gd_marks' => $gdMarks,
                                    'total_result' => $totalMarks,
                                    'status' => $status,
                                    'added_by' => $this->userId
                                );

                                // change the flag in enquiry table
                                $this->model_enquiry->update(array('isTestSubmited' => 1), $enqId);

                                $this->model_screeningtest->create($data);
                                $screenTestId = $this->db->insert_id();
                                if ($status == 1)
                                    $this->createTempStudentEnrollForm($this->input->post('enquiryId'), $screenTestId, true);
                                $isUpdated = true;
                            }
                        }
                    } else {
                        $enqId = $getData[0];
                        $aptiDate = $getData[14];
                        $aptiMarks = $getData[15];
                        $gdDate = $getData[16];
                        $gdMarks = $getData[17];
                        $totalMarks = $getData[18];
                        $status = $getData[19];
                        if ($enqId == "Enquiry Id" && $aptiDate == "Aptitude Test Date" && $aptiMarks == "Aptitude Test Marks" && $gdDate == "Group Discussion Date" && $gdMarks == "Group Discussion Marks" && $totalMarks == "Total Marks" && $status == "Pass/Fail")
                            $isValid = true;
                    }
                    $i++;
                }

                if ($isUpdated) {
                    $this->session->set_flashdata('success', 'Test Submitted Successfully!!');
                    redirect('screeningtest/manage', 'refresh');
                } else {
                    $this->session->set_flashdata('error', 'Unable to submit the tests!!');
                    redirect('assessments/fileview', 'refresh');
                }
            } else {
                $this->session->set_flashdata('error', 'Invalid file selected, Please selecte CSV file only!');
                redirect('assessments/fileview', 'refresh');
            }
        } else {
            $this->session->set_flashdata('error', 'Please select file!!');
            redirect('assessments/fileview', 'refresh');
        }
    }




    // TO Display DTATA

    public function show()
    {
        $this->data['dassess'] = $this->Model_assessment->get_all_assessments(); // Get data from model
        $this->render_template('assessments/display', $this->data);
    }

    public function fileview()
    {
        print_r($data);
        die();
        $this->render_template('assessments/viewdata', $this->data);
    }

    //added by Raj
    public function validateFormFile($field_name)
    {
        echo ($field_name);

        if (empty($_FILES[$field_name]['name'])) {

            $this->form_validation->set_message('error', 'The ' . $field_name . ' field is required.');
            return FALSE;
        } else {
            return TRUE;
        }
    }



    // DELETE assessment 
    public function delete_assessment($id)
    {
        if ($id) {
            $deleted = $this->Model_assessment->delete_assessment($id);
            if ($deleted) {
                echo json_encode(['success' => true]);
            } else {
                echo json_encode(['success' => false]);
            }
        }
    }
}
