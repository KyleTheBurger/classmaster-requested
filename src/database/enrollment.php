<?php
include("DBConnection.php");

if (isset($_SERVER['HTTP_ORIGIN'])) {
    header("Access-Control-Allow-Origin: {$_SERVER['HTTP_ORIGIN']}");
    header('Access-Control-Allow-Credentials: true');
    header('Access-Control-Max-Age: 86400');
}

if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_METHOD']))
        header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
    if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']))
        header("Access-Control-Allow-Headers: {$_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']}");
    exit(0);
}

header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $input = json_decode(file_get_contents('php://input'), true);

    if (isset($input['students'])) {
        $studentsData = $input['students'];

        foreach ($studentsData as $student) {
            $student_id = mysqli_real_escape_string($conn, $student['student_id']);
            $lrn = mysqli_real_escape_string($conn, $student['lrn']);
            $name = mysqli_real_escape_string($conn, $student['name']);
            $gwa = mysqli_real_escape_string($conn, $student['gwa']);
            $gender = mysqli_real_escape_string($conn, $student['gender']);
            $birthdate = isset($student['birthdate']) ? mysqli_real_escape_string($conn, $student['birthdate']) : null;
            $clsf = mysqli_real_escape_string($conn, $student['clsf']);
            $track = mysqli_real_escape_string($conn, $student['track']);
            $strand = mysqli_real_escape_string($conn, $student['strand']);
            $grade_level = mysqli_real_escape_string($conn, $student['grade_level']);
            $shift = mysqli_real_escape_string($conn, $student['shift']);
            $modality = mysqli_real_escape_string($conn, $student['modality']);
            $date_enrolled = isset($student['date_enrolled']) ? mysqli_real_escape_string($conn, $student['date_enrolled']) : null;
            $email = mysqli_real_escape_string($conn, $student['email']);
            $mobile_num = mysqli_real_escape_string($conn, $student['mobile_num']);
            $home_address = mysqli_real_escape_string($conn, $student['home_address']);
            $school_last_attended = mysqli_real_escape_string($conn, $student['school_last_attended']);
            $household_income = mysqli_real_escape_string($conn, $student['household_income']);
            $mother_name = mysqli_real_escape_string($conn, $student['mother_name']);
            $mother_mobile_no = mysqli_real_escape_string($conn, $student['mother_mobile_no']);
            $father_name = mysqli_real_escape_string($conn, $student['father_name']);
            $father_mobile_no = mysqli_real_escape_string($conn, $student['father_mobile_no']);
            $guardian = mysqli_real_escape_string($conn, $student['guardian']);
            $guardian_mobile_no = mysqli_real_escape_string($conn, $student['guardian_mobile_no']);


            $checkQuery = "SELECT COUNT(*) as count FROM `classmaster`.`student` WHERE `student_id` = '$student_id' OR `lrn` = '$lrn'";
            $checkResult = mysqli_query($conn, $checkQuery);
            $row = mysqli_fetch_assoc($checkResult);

            if ($row['count'] == 0) {
                // Insert new student if they don't already exist

                if (!mysqli_query($conn, $sql)) {
                    echo json_encode(["error" => mysqli_error($conn)]);
                    exit;
                }
            }
        }
        echo json_encode(["success" => true]);
        exit;
    }
}

function updateSection($selectedStudent, $newSection)
{
    global $conn;
    foreach ($selectedStudent as $student) {
        $student_id = mysqli_real_escape_string($conn, $student['student_id']);
        $section_id = getSectionID($newSection);
        $sql = "CALL classmaster.updateSection('$student_id', '$section_id')";
        if (!mysqli_query($conn, $sql)) {
            echo json_encode(["error" => mysqli_error($conn)]);
            exit;
        }
    }
    echo json_encode(["success" => true]);
    exit;
}

function getStudentList()
{
    global $conn;
    $data = array();
    $sql = "SELECT * FROM `classmaster`.`student`;";
    $result = mysqli_query($conn, $sql);
    while ($row = mysqli_fetch_assoc($result)) {
        $data[] = $row;
    }
    return $data;
}
function getSectionList($cohort_name)
{
    global $conn;
    $data = array();
    $sql = "CALL classmaster.getSectionList('$cohort_name')";
    $result = mysqli_query($conn, $sql);
    while ($row = mysqli_fetch_assoc($result)) {
        $data[] = $row;
    }
    return $data;
}
function getSectionID($sectionName)
{
    global $conn;
    $data = NULL;
    $sql = "SELECT section_id FROM section WHERE section_name = '$sectionName'";
    $result = mysqli_query($conn, $sql);
    while ($row = mysqli_fetch_assoc($result)) {
        $data = $row['section_id'];
    }
    return $data;
}
function filterStudentTable($strand, $grade_lvl, $shift, $search)
{
    global $conn;
    $data = array();
    $sql = "CALL classmaster.filterStudentTable('$strand','$grade_lvl','$shift','$search');";
    $result = mysqli_query($conn, $sql);
    while ($row = mysqli_fetch_assoc($result)) {
        $data[] = $row;
    }
    return $data;
}

// Retrieve data

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    $data = getStudentList();
    if (isset($_GET['filterStudentTable'])) {
        $strand = isset($_GET['strand']) ? $_GET['strand'] : '';
        $grade_lvl = isset($_GET['grade_lvl']) ? $_GET['grade_lvl'] : '';
        $shift = isset($_GET['shift']) ? $_GET['shift'] : 'all';
        $search = isset($_GET['search']) ? $_GET['search'] : '';
        $data = filterStudentTable($strand, $grade_lvl, $shift, $search);
    } else if (isset($_GET['getSectionList'])) {
        $cohort_name = $_GET['cohort'];
        $data = getSectionList($cohort_name);
    } else if (isset($_GET['updateSection'])) {
        $data = getSectionID($sectionName);
    }
    header('Content-Type: application/json');
    echo json_encode($data);
    exit;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $input = file_get_contents('php://input');
    $body = json_decode($input, true);

    if (isset($body['updateSection'])) {
        $selectedStudent = $body['selectedStudent'];
        $newSection = $body['newSection'];
        updateSection($selectedStudent, $newSection);
    }
}
