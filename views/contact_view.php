<?php
  $row = $data->fetch_assoc();
  echo '<h1 class="text-light">Контакты в городе ' . $row["city"] . '</h1>';
  echo '<ul class="list-group list-group-flush">';
  echo "<li class='list-group-item list-group-item-dark'> Телефон: " . $row["tel_number"] . "</li>
 <li class='list-group-item list-group-item-dark'>e-mail: " . $row["email"] . "</li>";
 echo '</ul>';
?>