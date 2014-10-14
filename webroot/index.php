<html>
<head>
    <title>RJMetrics Example</title>
</head>
<body>
<?php
$con = mysqli_connect('localhost', 'root', 'd1fa4a7da52440d6a6e86e9780233271', 'rjmetrics');
if (!$con) {
    die('Could not connect: ' . mysql_error());
}
$result = mysqli_query($con, "SELECT * from people");
?><table>
    <tr>
      <th>First Name</th>
      <th>Last Name</th>
    </tr>
<?php
while($row = mysqli_fetch_array($result)) {
  ?><tr>
      <td><?php echo $row['first_name'] ?></td>
      <td><?php echo $row['first_name'] ?></td>
    </tr><?php
}
?></table><?php
mysqli_close($con);
?>
</body>
</html>
