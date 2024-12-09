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

function getFacultyLoad($cohort_name, $availability, $name)
{
    global $conn;
    $data = array();
    $sql = "CALL classmaster.getCohortTable('$cohort_name','$availability', '$name')";
    if ($result = mysqli_query($conn, $sql)) {
        while ($row = mysqli_fetch_assoc($result)) {
            $data[] = $row;
        }
        mysqli_free_result($result);

        // Make sure all results have been processed
        while (mysqli_next_result($conn)) {
            if ($result = mysqli_store_result($conn)) {
                mysqli_free_result($result);
            }
        }
    } else {
        die('Error: ' . mysqli_error($conn));
    }
    return $data;
}

function stringToBool($string)
{
    $string = strtolower($string); // Convert the string to lowercase
    if ($string === 'true' || $string === '1') {
        return 1;
    } else {
        return 0;
    }
}

function getCohortLoadingStatistic()
{
    global $conn;
    $sql = "CALL classmaster.getCohortLoadingStatistic();";
    $result = mysqli_query($conn, $sql);
    while ($row = mysqli_fetch_assoc($result)) {
        $data = $row;
    }
    return $data;
}
function getCohortStatus()
{
    global $conn;
    $sql = "CALL classmaster.getCohortStatus();";
    $result = mysqli_query($conn, $sql);
    while ($row = mysqli_fetch_assoc($result)) {
        $data[] = $row;
    }
    return $data;
}

function getSectionInfo($section_name)
{
    global $conn;
    $data = null;
    $section_id = getSectionID($section_name);
    $sql = "CALL classmaster.getCohortInfo('$section_id');";
    $result = mysqli_query($conn, $sql);
    while ($row = mysqli_fetch_assoc($result)) {
        $data = $row;
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

function getSubject($domain_name)
{
    global $conn;
    $data = null;
    $domain_id = getDomainID($domain_name);
    $sql = "SELECT classmaster.getSubject('$domain_id') AS subject_name;";
    $result = mysqli_query($conn, $sql);
    while ($row = mysqli_fetch_assoc($result)) {
        $data = $row;
    }
    return $data;
}
function getDomainID($domain_name)
{
    global $conn;
    $data = NULL;
    $sql = "SELECT domain_id FROM domain WHERE domain_name = '$domain_name'";
    $result = mysqli_query($conn, $sql);
    while ($row = mysqli_fetch_assoc($result)) {
        $data = $row['domain_id'];
    }
    return $data;
}

function setCohortLoad($employee_id, $domain_name, $section_name, $isAdviser)
{
    global $conn;
    $section_id = getSectionID($section_name);
    $domain_id = getDomainID($domain_name);
    $isAdviser = stringToBool($isAdviser);
    $sql = "call classmaster.insert_cohortloading('$domain_id', '$section_id', '$employee_id', '$isAdviser')";
    if (!mysqli_query($conn, $sql)) {
        echo json_encode(["error" => mysqli_error($conn)]);
        exit;
    }
    echo json_encode(["success" => true]);
    exit;
}

//GET METHOD
if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    $data = getFacultyLoad('ABM', '0', '');

    if (isset($_GET['filterCohortLoadingTable'])) {
        $cohort_name = isset($_GET['cohort_name']) ? $_GET['cohort_name'] : '';
        $availability = stringToBool($_GET['availability']);
        $name = isset($_GET['name']) ? $_GET['name'] : '';
        $data = getFacultyLoad($cohort_name, $availability, $name);
    }
    if (isset($_GET['getSectionInfo'])) {
        $section_name = isset($_GET['section_name']) ? $_GET['section_name'] : '';
        $data = getSectionInfo($section_name);
    }
    if (isset($_GET['getSubject'])) {
        $domain_name = isset($_GET['domain_name']) ? $_GET['domain_name'] : '';
        $data = getSubject($domain_name);
    }
    if (isset($_GET['getCohortLoadingStatistic'])) {
        $data = getCohortLoadingStatistic();
    }
    if (isset($_GET['getCohortStatus'])) {
        $data = getCohortStatus();
    }
    header('Content-Type: application/json');
    echo json_encode($data);
    exit;
}


if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $input = file_get_contents('php://input');
    $body = json_decode($input, true);

    if (isset($body['insertCohortLoad'])) {
        $employee_id = $body['employee_id'];
        $section_name = $body['section_name'];
        $domain_name = $body['domain_name'];
        $isAdviser = $body['isAdviser'];
        setCohortLoad($employee_id, $domain_name, $section_name, $isAdviser);
    }
}
