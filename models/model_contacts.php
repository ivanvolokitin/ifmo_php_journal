<?php 
  class Model_Contacts extends Model {
    public function get_data($id = -1) {
      if ($id <> -1) {
        $result = $this->executeQuery("SELECT * FROM contacts WHERE id=".$id);
      } else {
        $result = $this->executeQuery("SELECT * FROM contacts");
      }
      return $result;
    }
  }
?>