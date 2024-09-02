<?php
// profile.php

session_start();

// Database connection
$servername = "localhost:3307"; // Adjust as needed
$username = "root";        // Adjust as needed
$password = "";            // Adjust as needed
$dbname = "university_finder"; // Adjust as needed

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if (!isset($_SESSION['userId'])) {
    header("Location: login.php"); // Redirect to login if user is not logged in
    exit();
}

$userId = $_SESSION['userId'];

// Fetch user details
$sql = "SELECT username, email, phonenumber, address, cet_marks, tenth_marks, twelfth_marks, profile_picture FROM users WHERE id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $userId);
$stmt->execute();
$stmt->bind_result($username, $email, $phonenumber, $address, $cetMarks, $tenthMarks, $twelfthMarks, $profilePicture);
$stmt->fetch();
$stmt->close();

// Fetch certificates
$sql = "SELECT certificate FROM certificates WHERE user_id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $userId);
$stmt->execute();
$result = $stmt->get_result();
$certificates = [];
while ($row = $result->fetch_assoc()) {
    $certificates[] = $row['certificate'];
}
$stmt->close();

$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile - University Finder</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #121212;
            color: #e0e0e0;
            margin: 0;
            padding: 0;
        }
        .navbar {
            display: flex;
            justify-content: space-between;
            background-color: #1f1f1f;
            padding: 1rem;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5);
        }
        .navbar a {
            color: #e0e0e0;
            text-decoration: none;
            padding: 0.5rem 1rem;
            font-size: 1rem;
        }
        .navbar a:hover {
            background-color: #333333;
            border-radius: 4px;
        }
        .navbar .logo {
            display: flex;
            align-items: center;
            font-size: 1.4rem;
            font-weight: bold;
        }
        .navbar .logo img {
            height: 50px;
            margin-right: 0.5rem;
            border-radius: 50%;
        }
        .container {
            max-width: 900px;
            margin: 20px auto;
            padding: 2rem;
            background-color: #1c1c1c;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.7);
        }
        h1, h2, h3 {
            color: #76c7c0;
        }
        .profile-header {
            display: flex;
            align-items: center;
            border-bottom: 2px solid #333333;
            padding-bottom: 20px;
            margin-bottom: 20px;
        }
        .profile-header img {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            border: 4px solid #76c7c0;
            object-fit: cover;
        }
        .upload-section, .upload-form {
            margin-top: 20px;
            padding: 20px;
            border: 1px solid #333333;
            border-radius: 8px;
            background-color: #252525;
        }
        .upload-form label, .profile-details p {
            color: #b3b3b3;
        }
        .button {
            background-color: #76c7c0;
            color: #121212;
            border: none;
            padding: 0.7rem;
            border-radius: 4px;
            cursor: pointer;
            text-align: center;
            margin-top: 1rem;
            font-size: 1rem;
            transition: background-color 0.3s;
        }
        .button:hover {
            background-color: #5aa8a2;
        }
        .certificate-gallery {
            display: flex;
            flex-wrap: wrap;
            margin-top: 10px;
        }
        .certificate-gallery img {
            max-width: 150px;
            margin: 10px;
            border-radius: 4px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5);
        }
        .hidden {
            display: none;
        }
        .marks-input {
            width: 100%;
            padding: 0.5rem;
            margin: 0.5rem 0;
            background-color: #1f1f1f;
            border: 1px solid #333333;
            border-radius: 4px;
            color: #e0e0e0;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <div class="logo">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSadbBO57YIUp9s54yBrhwIRNNaLtbtH-A2Ug&usqp=CAU" alt="UniversityFinder Logo">
            UniversityFinder
        </div>
        <div>
            <a href="index2.html">Home</a>
            <a href="about.html">About</a>
            <a href="contact.html">Contact</a>
            <a href="review.html">Review</a>
            <a href="profile.php">Profile</a>
        </div>
    </div>
    
    <div class="container">
        <h1>Welcome, <?php echo htmlspecialchars($username); ?>!</h1>
        
        <div class="profile-header">
            <?php if ($profilePicture): ?>
                <img src="uploads/<?php echo htmlspecialchars($profilePicture); ?>" alt="Profile Picture">
            <?php else: ?>
                <img src="default-profile.jpg" alt="Default Profile Picture">
            <?php endif; ?>
            <div>
                <h2><?php echo htmlspecialchars($username); ?></h2>
                <p>Student at XYZ University</p>
            </div>
        </div>

        <div class="upload-form">
            <h2>Upload Profile Picture</h2>
            <form id="profileForm" action="upload_profile_picture.php" method="POST" enctype="multipart/form-data">
                <input type="file" id="profileUpload" name="profileUpload" accept="image/*">
                <button type="submit" class="button">Upload Profile Picture</button>
            </form>
        </div>

        <div class="profile-details">
            <h2>Profile Details</h2>
            <p><strong>Email:</strong> <?php echo htmlspecialchars($email); ?></p>
            <p><strong>Phone Number:</strong> <?php echo htmlspecialchars($phonenumber); ?></p>
            <p><strong>Address:</strong> <?php echo htmlspecialchars($address); ?></p>
            <p><strong>CET Marks:</strong> <span id="cet-marks"><?php echo htmlspecialchars($cetMarks); ?>%</span></p>
            <p><strong>10th Boards Marks:</strong> <span id="tenth-marks"><?php echo htmlspecialchars($tenthMarks); ?>%</span></p>
            <p><strong>12th Boards Marks:</strong> <span id="twelfth-marks"><?php echo htmlspecialchars($twelfthMarks); ?>%</span></p>
        </div>

        <div class="upload-section">
            <h2>Upload Certificates</h2>
            <form id="certificateForm" action="upload_certificates.php" method="POST" enctype="multipart/form-data">
                <input type="file" id="certificateUpload" name="certificateUpload" accept="image/*">
                <button type="submit" class="button">Upload Certificate</button>
            </form>
            <div id="certificateGallery" class="certificate-gallery <?php if (empty($certificates)) echo 'hidden'; ?>">
                <h3>Your Certificates:</h3>
                <?php foreach ($certificates as $certificate): ?>
                    <img style="width:200px; height:150px;" src="uploads/certificates/<?php echo htmlspecialchars($certificate); ?>" alt="Certificate">
                <?php endforeach; ?>
            </div>
        </div>

        <div class="upload-form">
            <h2>Update Marks</h2>
            <form id="marksForm" action="update_marks.php" method="POST">
                <label for="cetMarks">CET Marks:</label>
                <input type="text" id="cetMarks" name="cetMarks" placeholder="Enter CET Marks" class="marks-input" value="<?php echo htmlspecialchars($cetMarks); ?>">
                
                <label for="tenthMarks">10th Boards Marks:</label>
                <input type="text" id="tenthMarks" name="tenthMarks" placeholder="Enter 10th Boards Marks" class="marks-input" value="<?php echo htmlspecialchars($tenthMarks); ?>">
                
                <label for="twelfthMarks">12th Boards Marks:</label>
                <input type="text" id="twelfthMarks" name="twelfthMarks" placeholder="Enter 12th Boards Marks" class="marks-input" value="<?php echo htmlspecialchars($twelfthMarks); ?>">
                
                <button type="submit" class="button">Update Marks</button>
            </form>
        </div>
    </div>
</body>
</html>
