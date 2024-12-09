<?php
include("DBConnection.php");

if (isset($_SERVER['HTTP_ORIGIN'])) {
    header("Access-Control-Allow-Origin: {$_SERVER['HTTP_ORIGIN']}");
    header('Access-Control-Allow-Credentials: true');
}

if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_METHOD']))
        header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
    if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']))
        header("Access-Control-Allow-Headers: {$_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']}");
    exit(0);
}

function getFacultyList()
{
    global $conn;
    $data = array();
    $sql = "SELECT * FROM `classmaster`.facultyList";
    $result = mysqli_query($conn, $sql);
    while ($row = mysqli_fetch_assoc($result)) {
        $data[] = $row;
    }
    return $data;
}
function getFacultyStatistic()
{
    global $conn;
    $sql = "CALL classmaster.getFacultyStatistic();";
    $result = mysqli_query($conn, $sql);
    while ($row = mysqli_fetch_assoc($result)) {
        $data = $row;
    }
    return $data;
}
function filterFacultyTable($gender, $status, $name)
{
    global $conn;
    $data = array();
    $sql = "CALL classmaster.filterFacultyTable('$gender','$status','$name');";
    $result = mysqli_query($conn, $sql);
    while ($row = mysqli_fetch_assoc($result)) {
        $data[] = $row;
    }
    return $data;
}

function insertFacultyInfo($faculty)
{
    global $conn;
    $employee_id = $faculty['employee_id'];
    $lname = $faculty['lname'];
    $fname = $faculty['fname'];
    $mname = $faculty['mname'];
    $bachelor_degree = $faculty['bachelor_degree'];
    $specialization = $faculty['specialization'];
    $email = $faculty['email'];
    $prc_license_num = $faculty['prc_license_num'];
    $mobile_num = $faculty['mobile_num'];
    $birthdate = $faculty['birthdate'];
    $sex = $faculty['sex'];

    $sql = "call classmaster.insertFacultyInformation('$employee_id', '$lname', '$fname', '$mname', '$bachelor_degree', '$specialization', '$email', '$prc_license_num', '$mobile_num', '$birthdate', '$sex');";
    if (!mysqli_query($conn, $sql)) {
        echo json_encode(["error" => mysqli_error($conn)]);
        exit;
    }
    echo json_encode(["success" => true]);
}
function updateFacultyInfo($faculty)
{
    global $conn;
    $employee_id = $faculty['employee_id'];
    $lname = $faculty['lname'];
    $fname = $faculty['fname'];
    $mname = $faculty['mname'];
    $bachelor_degree = $faculty['bachelor_degree'];
    $specialization = $faculty['specialization'];
    $email = $faculty['email'];
    $prc_license_num = $faculty['prc_license_num'];
    $mobile_num = $faculty['mobile_num'];
    $birthdate = $faculty['birthdate'];
    $sex = $faculty['sex'];

    $sql = "call classmaster.updateFacultyInformation('$employee_id', '$lname', '$fname', '$mname', '$bachelor_degree', '$specialization', '$email', '$prc_license_num', '$mobile_num', '$birthdate', '$sex');";
    if (!mysqli_query($conn, $sql)) {
        echo json_encode(["error" => mysqli_error($conn)]);
        exit;
    }
    echo json_encode(["success" => true]);
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $faculties = json_decode(file_get_contents('php://input'), true);
    $facultyIDs = array_map(function ($faculty) {
        return $faculty['employee_id'];
    }, $faculties);

    foreach ($faculties as $faculty) {
        $facultyID = $faculty['employee_id'];

        // 1. Check the existence
        $sql = "SELECT employee_id FROM faculty WHERE employee_id = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param('s', $facultyID);
        $stmt->execute();
        $result = $stmt->get_result();

        // 2. Verify and update/insert
        if ($result->num_rows > 0) {
            updateFacultyInfo($faculty);
        } else {
            insertFacultyInfo($faculty);
        }

        $stmt->close();
    }

    // After the loop, deactivate faculties not included in the $faculties array
    if (!empty($facultyIDs)) {
        $placeholders = rtrim(str_repeat('?,', count($facultyIDs)), ',');
        $deactivateSQL = "UPDATE faculty SET status = 'Deactivated' WHERE employee_id NOT IN ($placeholders)";
        $deactivateStmt = $conn->prepare($deactivateSQL);
        $deactivateStmt->bind_param(str_repeat('s', count($facultyIDs)), ...$facultyIDs);
        $deactivateStmt->execute();
        $deactivateStmt->close();
    }

    echo json_encode(["success" => true]);
    exit;
}

if ($_SERVER['REQUEST_METHOD'] === 'GET') { //read or received data from database
    $data = getFacultyList();
    if (isset($_GET['getFacultyList'])) {
        $data = getFacultyList();
    } else if (isset($_GET['getFacultyStatistic'])) {
        $data = getFacultyStatistic();
    } else if (isset($_GET['filterFacultyTable'])) {
        $gender = isset($_GET['gender']) ? $_GET['gender'] : '';
        $status = isset($_GET['status']) ? $_GET['status'] : '';
        $name = isset($_GET['name']) ? $_GET['name'] : '';
        $data = filterFacultyTable($gender, $status, $name);
    }
    header('Content-Type: application/json');
    echo json_encode($data);
    exit;
}
