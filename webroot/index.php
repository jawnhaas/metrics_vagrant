<html>
<head>
    <title>RJMetrics Example</title>
</head>
<body>
<?php
$con = mysqli_connect('localhost', 'root', '', 'rjmetrics');
if (!$con) {
    die('Could not connect: ' . mysql_error());
}
$result = mysqli_query($con, "SELECT * FROM people");
?><table>
    <tr>
      <td><b>First Name</b></td>
      <td><b>Last Name</b></td>
      <td><b>Country</b></td>
    </tr>
<?php
while($row = mysqli_fetch_array($result)) {
  ?><tr>
      <td><?php echo $row['first_name'] ?></td>
      <td><?php echo $row['last_name'] ?></td>
      <td><?php echo $row['country'] ?></td>
    </tr><?php
}
?></table><?php
mysqli_close($con);
?>
</body>
</html>
