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

function getSubjectList()
{
    global $conn;
    $data = array();
    $sql = "CALL classmaster.getSubjectList()";
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

function insertSubject($name, $type, $lvl, $semester, $unit, $domain, $strand)
{
    global $conn;
    $sql = "CALL classmaster.insertSubject('$name', '$type', '$lvl', '$semester', '$unit', '$domain','$strand')";
    if (!mysqli_query($conn, $sql)) {
        echo json_encode(["error" => mysqli_error($conn)]);
        exit;
    }
    echo json_encode(["success" => true]);
    exit;
}

function updateSubject($id, $name, $type, $lvl, $semester, $unit, $domain, $strand)
{
    global $conn;
    $sql = "CALL classmaster.updateSubjectInfo('$id','$name', '$type', '$lvl', '$semester', '$unit', '$domain','$strand')";
    if (!mysqli_query($conn, $sql)) {
        echo json_encode(["error" => mysqli_error($conn)]);
        exit;
    }
    echo json_encode(["success" => true]);
    exit;
}

function filterTheTable($domain, $lvl, $name)
{
    global $conn;
    $data = array();
    $sql = "CALL classmaster.filterSubjectTable('$domain', '$lvl', '$name');";
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
    if (isset($_GET['filterSubjectTable'])) {
        $domain = isset($_GET['domain']) ? $_GET['domain'] : '';
        $lvl = isset($_GET['lvl']) ? $_GET['lvl'] : '';
        $name = isset($_GET['name']) ? $_GET['name'] : '';

        $data = filterTheTable($domain, $lvl, $name);
    } else {
        $data = getSubjectList();
    }
    header('Content-Type: application/json');
    echo json_encode($data);
    exit;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $input = file_get_contents('php://input');
    $body = json_decode($input, true);

    if (isset($body['insertSubject'])) {
        $id = $body['id'];
        $name = $body['name'];
        $type = $body['type'];
        $lvl = $body['lvl'];
        $semester = $body['semester'];
        $unit = $body['unit'];
        $domain = $body['domain'];
        $strand = $body['strand'];

        if ($id != null) {
            updateSubject($id, $name, $type, $lvl, $semester, $unit, $domain, $strand);
        } else {
            insertSubject($name, $type, $lvl, $semester, $unit, $domain, $strand);
        }
    }
}
