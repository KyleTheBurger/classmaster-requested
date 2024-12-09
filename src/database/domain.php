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

function getDomainList()
{
    global $conn;
    $data = array();
    $sql = "CALL classmaster.getDomain()";
    $result = mysqli_query($conn, $sql);
    while ($row = mysqli_fetch_assoc($result)) {
        $data[] = $row;
    }
    return $data;
}

function insertDomain($domain_name, $domain_description)
{
    global $conn;
    $sql = "call classmaster.insertDomain('$domain_name', '$domain_description')";
    if (!mysqli_query($conn, $sql)) {
        echo json_encode(["error" => mysqli_error($conn)]);
        exit;
    }
    echo json_encode(["success" => true]);
    exit;
}
function updateDomain($domain_id, $domain_description)
{
    global $conn;
    $sql = "call classmaster.updateDomainDescription('$domain_id', '$domain_description')";
    if (!mysqli_query($conn, $sql)) {
        echo json_encode(["error" => mysqli_error($conn)]);
        exit;
    }
    echo json_encode(["success" => true]);
    exit;
}

if ($_SERVER['REQUEST_METHOD'] === 'GET') { //read or received data from database
    $data = getDomainList();
    // if (isset($_GET['getFacultyList'])) {
    //     $function = isset($_GET['getFacultyList']) ? $_GET['getFacultyList'] : 'All';
    //     $data = getFacultyList($function);
    // } else if (isset($_GET['getFacultyStatistic'])) {
    //     $data = getFacultyStatistic();
    // } else if (isset($_GET['filterFacultyTable'])) {
    //     $role = isset($_GET['role']) ? $_GET['role'] : '';
    //     $status = isset($_GET['status']) ? $_GET['status'] : '';
    //     $name = isset($_GET['name']) ? $_GET['name'] : '';
    //     $data = filterFacultyTable($role, $status, $name);
    // }
    header('Content-Type: application/json');
    echo json_encode($data);
    exit;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $input = file_get_contents('php://input');
    $body = json_decode($input, true);

    if (isset($body['insertUpdateDomain'])) {
        $domain_id = $body['domain_id'];
        $domain_name = $body['domain_name'];
        $description = $body['description'];

        if ($domain_id == "" || $domain_id == NULL) {
            insertDomain($domain_name, $description);
        } else {
            updateDomain($domain_id, $description);
        }
    }
}
