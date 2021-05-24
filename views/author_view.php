<h1 class="text-light">Информация об авторе нашего сайта</h1>
<?php
  echo '<ul class="list-group list-group-flush">';
//for ($row_no = 0; $row_no <= $data->num_rows - 1; $col_no++) {
  //$data->data_seek($row_no);
  $row = $data->fetch_assoc();
  echo "<li class='list-group-item list-group-item-dark'>" . $row['id'] . "</li>
 <li class='list-group-item list-group-item-dark'>" . $row['fio'] . "</li>
 <li class='list-group-item list-group-item-dark'>" . $row['age'] . "</li>
 <li class='list-group-item list-group-item-dark'>" . $row['location'] . "</li>
 <li class='list-group-item list-group-item-dark'>" . $row['additional'] . "</li>";
 echo "</ul>";
//}
?>