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

function getCohortList()
{
    global $conn;
    $data = array();
    $sql = "SELECT * FROM cohortlist";
    if ($result = mysqli_query($conn, $sql)) {
        while ($row = mysqli_fetch_assoc($result)) {
            if (isset($row['associated_strands'])) {
                $row['associated_strands'] = explode(', ', $row['associated_strands']);
            }
            if (isset($row['learning_facilitator'])) {
                $row['learning_facilitator'] = explode(', ', $row['learning_facilitator']);
            }
            $data[] = $row;
        }
        mysqli_free_result($result);
    } else {
        echo json_encode(["error" => mysqli_error($conn)]);
        exit;
    }
    return $data;
}

function getCohortFacultyTableList($cohort_name, $search)
{
    global $conn;
    $data = array();
    $sql = "CALL classmaster.getCohortFacultyTableList('$cohort_name','$search')";
    if ($result = mysqli_query($conn, $sql)) {
        while ($row = mysqli_fetch_assoc($result)) {
            $data[] = $row;
        }
        mysqli_free_result($result);
    } else {
        echo json_encode(["error" => mysqli_error($conn)]);
        exit;
    }
    return $data;
}

function getCohortFaculty($cohort_name)
{
    global $conn;
    $data = array();
    $sql = "CALL classmaster.getCohortFaculty('$cohort_name')";
    if ($result = mysqli_query($conn, $sql)) {
        while ($row = mysqli_fetch_assoc($result)) {
            $data[] = $row;
        }
        mysqli_free_result($result);
    } else {
        echo json_encode(["error" => mysqli_error($conn)]);
        exit;
    }
    return $data;
}
function getAssociatedStrand($cohort)
{
    global $conn;
    $data = array();
    $sql = "CALL classmaster.getAssociatedStrand('$cohort')";
    if ($result = mysqli_query($conn, $sql)) {
        while ($row = mysqli_fetch_assoc($result)) {
            $data[] = $row;
        }
        mysqli_free_result($result);
    } else {
        echo json_encode(["error" => mysqli_error($conn)]);
        exit;
    }
    return $data;
}

// REQUEST
if ($_SERVER['REQUEST_METHOD'] === 'GET') { // read or receive data from database
    $data = getCohortList();
    if (isset($_GET['getAssociatedStrand'])) {
        if (isset($_GET['cohort'])) {
            $cohort = $_GET['cohort'];
            $data = getAssociatedStrand($cohort);
        } else {
            echo json_encode(["error" => "Cohort parameter is missing"]);
            exit;
        }
    } else if (isset($_GET['getCohortFaculty'])) {
        if (isset($_GET['cohort'])) {
            $cohort = $_GET['cohort'];
            $data = getCohortFaculty($cohort);
        } else {
            echo json_encode(["error" => "Cohort parameter is missing"]);
            exit;
        }
    } else if (isset($_GET['getCohortFacultyTableList'])) {
        if (isset($_GET['cohort'])) {
            $cohort = $_GET['cohort'];
            $search = isset($_GET['search']) ? $_GET['search'] : "";
            $data = getCohortFacultyTableList($cohort, $search);
        } else {
            echo json_encode(["error" => "Cohort parameter is missing"]);
            exit;
        }
    }
    header('Content-Type: application/json');
    echo json_encode($data);
    exit;
}

function assignFacultyToCohort($faculty, $cohort)
{
    global $conn;
    $employee_id = $faculty['id'];
    $designation = $faculty['designation'];
    $sql = "CALL classmaster.assignFacultyToCohort('$employee_id','$cohort','$designation')";
    if (!mysqli_query($conn, $sql)) {
        echo json_encode(["error" => mysqli_error($conn)]);
        exit;
    }
    echo json_encode(["success" => true]);
}
function updateFacultyToCohort($faculty)
{
    global $conn;
    $cohort_assignment_id = $faculty['cohort_assignment_id'];
    $designation = $faculty['designation'];
    echo $designation;
    $sql = "CALL classmaster.updateFacultyCohortInformation('$cohort_assignment_id','$designation')";
    if (!mysqli_query($conn, $sql)) {
        echo json_encode(["error" => mysqli_error($conn)]);
        exit;
    }
    echo json_encode(["success" => true]);
}

function saveCohort($cohort, $assignedFaculties)
{
    global $conn;
    // Loop through each employee ID in the $assignedFaculties array
    foreach ($assignedFaculties as $employee) {
        $employeeID = $employee['id'];

        // 1. check the existence
        $sql = "SELECT ca.employee_id 
            FROM cohort_assignment ca
            JOIN cohort c ON ca.cohort_id = c.cohort_id
            WHERE employee_id = '$employeeID' AND cohort_name = '$cohort'";

        // 2. verify
        if ($resultP1 = mysqli_query($conn, $sql)) {
            if (mysqli_num_rows($resultP1) > 0) { // if faculty existed in the cohort
                updateFacultyToCohort($employee);
            } else {
                //check if the employee_id is supervisor in other cohort 
                $sql = "SELECT * FROM cohort_assignment 
                WHERE employee_id = '$employeeID' 
                AND designation = 'Learning Supervisor' 
                AND status = 'Active'";

                if ($resultP2 = mysqli_query($conn, $sql)) {
                    if (mysqli_num_rows($resultP2) > 0) {
                        echo "Not Possible: Already a supervisor";
                        return;
                    } else {
                        assignFacultyToCohort($employee, $cohort);
                    }
                }
            }
            mysqli_free_result($resultP1);
        } else {
            echo json_encode(["error" => mysqli_error($conn)]);
            exit;
        }
    }

    // Deactivate faculty in the cohort that are not in the $assignedFaculties array
    // First, create a subquery to select the employee_ids that should not be deactivated
    $subquery = "
        SELECT employee_id 
        FROM cohort_assignment 
        WHERE employee_id IN ('" . implode("','", array_column($assignedFaculties, 'id')) . "')
        ";

    // Now use the subquery in the main query
    $sql = "
    UPDATE cohort_assignment 
    SET status = 'Deactivated'
    WHERE cohort_id = GETCOHORTID('$cohort')
    AND employee_id NOT IN (
        SELECT employee_id 
        FROM ($subquery) AS temp_table
    )
    ";

    if (!mysqli_query($conn, $sql)) {
        echo json_encode(["error" => mysqli_error($conn)]);
        exit;
    }
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $input = file_get_contents('php://input');
    $body = json_decode($input, true);

    if (isset($body['saveCohortAssignment'])) {
        $data = $body['facultyData'];
        $cohort = $body['cohort'];

        saveCohort($cohort, $data);
    }
}
