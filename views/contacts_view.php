<h1 class="text-light">Контакты в городах:</h1>
<table class="table bg-dark text-light">
  <tr>   
    <th>Город</th>    
  </tr>
  <?php
  for ($row_no = 0; $row_no <= $data->num_rows - 1; $row_no++) {
    $data->data_seek($row_no);
    $row = $data->fetch_assoc();
    echo
    "<tr>     
      <td><a href='/journal/contacts/contact/?id=" . $row['id'] . "'>" . $row['city'] . "</a></td>
    </tr>";
  }
  ?>
</table>