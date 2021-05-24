<?php 
  class Model {
    function __construct()
    {
      $this->mysqli = mysqli_connect("db", "root", "mypassword", "POSTS");
      if ($this->mysqli === false) {
        die("ERROR: could not connect. " . mysqli_connect_error());
      }
    }
    public function executeQuery($query) {
      $res = $this->mysqli->query($query);
      return $res;
    }
    function __destruct()
    {
      $this->mysqli->close();
    }
  }
?>