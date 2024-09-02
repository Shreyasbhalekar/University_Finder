<?php
session_start();

if (!isset($_SESSION['userId'])) {
    header("Location: login.php");
    exit();
}

$target_dir = "uploads/certificates/";

// Check if the certificates directory exists, if not, create it
if (!is_dir($target_dir)) {
    if (!mkdir($target_dir, 0777, true)) {
        die("Failed to create directories...");
    }
}

$target_file = $target_dir . basename($_FILES["certificateUpload"]["name"]);
$uploadOk = 1;
$imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));

// Check if image file is a actual image or fake image
if(isset($_POST["submit"])) {
    $check = getimagesize($_FILES["certificateUpload"]["tmp_name"]);
    if($check !== false) {
        $uploadOk = 1;
    } else {
        echo "File is not an image.";
        $uploadOk = 0;
    }
}

// Check file size (optional)
if ($_FILES["certificateUpload"]["size"] > 500000) { // Example: limit to 500KB
    echo "Sorry, your file is too large.";
    $uploadOk = 0;
}

// Allow certain file formats (optional)
$allowed_extensions = array("jpg", "png", "jpeg", "gif");
if (!in_array($imageFileType, $allowed_extensions)) {
    echo "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
    $uploadOk = 0;
}

// Check if $uploadOk is set to 0 by an error
if ($uploadOk == 0) {
    echo "Sorry, your file was not uploaded.";
// Try to upload file
} else {
    if (move_uploaded_file($_FILES["certificateUpload"]["tmp_name"], $target_file)) {
        echo "The file ". htmlspecialchars( basename( $_FILES["certificateUpload"]["name"])). " has been uploaded.";

        // Update the user's certificates in the database
        $servername = "localhost:3307";
        $username = "root";
        $password = "";
        $dbname = "university_finder";

        $conn = new mysqli($servername, $username, $password, $dbname);

        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }

        $userId = $_SESSION['userId'];
        $sql = "INSERT INTO certificates (user_id, certificate) VALUES (?, ?)";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("is", $userId, $target_file);

        if ($stmt->execute()) {
            echo '<script> 
                    alert("Certificate uploaded successfully.")
                    window.location.href="profile.php";
                  </script>';
        } else {
            echo '<script>
                    alert("Error uploading certificate:  ' . $stmt->error .'");
                    window.location.href="profile.php";
                  </script>';
        }

        $stmt->close();
        $conn->close();

    } else {
        echo "Sorry, there was an error uploading your file.";
    }
}
?>
