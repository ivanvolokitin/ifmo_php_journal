<?php 
  class Model_News extends Model {
    public function get_data() {
      $res = $this->executeQuery("SELECT*FROM last_news");
      return $res;
    }
  }
?>