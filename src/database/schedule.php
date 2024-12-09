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
function stringToBool($string)
{
    $string = strtolower($string); // Convert the string to lowercase
    if ($string === 'true' || $string === '1') {
        return 1;
    } else {
        return 0;
    }
}
function filterTable($domain, $section, $search, $noSchedule)
{
    global $conn;
    $hasNoSchedule = stringToBool($noSchedule);
    $data = array();
    $sql = "CALL classmaster.filterScheduleTable(?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssss", $domain, $section, $search, $hasNoSchedule);
    $stmt->execute();
    $result = $stmt->get_result();
    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }
    $stmt->close();
    return $data;
}

function isValidScheduleTime($start_time, $end_time)
{
    // Define invalid time ranges
    $invalid_ranges = [
        ['00:00:00', '06:59:59'],
        ['20:31:00', '23:59:59']
    ];

    // Convert start time and end time to time objects
    $start_time_obj = strtotime($start_time);
    $end_time_obj = strtotime($end_time);

    foreach ($invalid_ranges as $range) {
        $range_start = strtotime($range[0]);
        $range_end = strtotime($range[1]);

        // Check if either start time or end time falls within the invalid range
        if (($start_time_obj >= $range_start && $start_time_obj <= $range_end) ||
            ($end_time_obj >= $range_start && $end_time_obj <= $range_end)
        ) {
            return false;
        }
    }
    return true;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Get access to the scheduleData 
    $scheduleData = json_decode(file_get_contents('php://input'), true);

    // Escape and sanitize input data
    $schedule_id = mysqli_real_escape_string($conn, $scheduleData['scheduleId']);
    $shift = mysqli_real_escape_string($conn, $scheduleData['shift']);
    $modality = mysqli_real_escape_string($conn, $scheduleData['modality']);
    $day_of_week = mysqli_real_escape_string($conn, $scheduleData['dayOfWeek']);
    $start_time = mysqli_real_escape_string($conn, $scheduleData['startTime']);
    $end_time = mysqli_real_escape_string($conn, $scheduleData['endTime']);
    $cohortloading_id = mysqli_real_escape_string($conn, $scheduleData['cohortloading_id']);

    // Check if the schedule time is valid
    if (!isValidScheduleTime($start_time, $end_time)) {
        echo json_encode(["error" => "Invalid schedule time."]);
        exit;
    }
    // If the schedule ID doesn't exist, insert the new schedule

    $sql = "CALL classmaster.insertSchedule('$schedule_id','$shift','$modality','$day_of_week','$start_time','$end_time','$cohortloading_id')";
    if (!mysqli_query($conn, $sql)) {
        echo json_encode(["error" => mysqli_error($conn)] . $sql);
        exit;
    }
    echo json_encode(["success" => true]);
    exit;
}

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    // Get filter parameters
    $domain = isset($_GET['domain']) ? $_GET['domain'] : '';
    $section = isset($_GET['section']) ? $_GET['section'] : '';
    $search = isset($_GET['search']) ? $_GET['search'] : '';
    $noSchedule = isset($_GET['noSchedule']) ? $_GET['noSchedule'] : 'false';


    // Log the incoming filter parameters
    error_log("Filter Parameters: domain=$domain, section=$section, search=$search, noSchedule=$noSchedule");

    // Fetch data using stored procedure
    $data = filterTable($domain, $section, $search, $noSchedule);

    // Log the filtered data
    error_log("Filtered Data: " . json_encode($data));

    // Return the data as JSON
    header('Content-Type: application/json');
    echo json_encode($data);
}
