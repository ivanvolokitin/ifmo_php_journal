<h1 class="text-light">Оставьте обратную связь о нашем сайте!</h1>
<form action="/journal/feedback/send" method="POST">
  <div class="form-group"><input placeholder="Введите ваше имя" name="user" type="text" class="form-control" required></div>
  <div class="form-group"><input placeholder="Введите вашу электронную почту" type="email" name="email" class="form-control" required></div>
  <div class="form-group"><textarea name="comment" placeholder="Введите ваш комментарий" class="form-control" required></textarea></div>
  <div class="form-group">
    <input type="button" onclick="sendData()" value="Отправить" class="btn btn-primary">
    <input type="reset" value="Очистить" class="btn btn-secondary">
  </div>
</form>
<script>
  {
    "use strict";

    function sendData() {
      let xhr = new XMLHttpRequest();
      feedbackForm = document.forms[0],
        formData = new FormData(feedbackForm)
      xhr.open("POST", '/journal/feedback/send')

      xhr.onloadend = function() {
        if (xhr.status == 200) {
          if (xhr.response == 1) {
            alert('Добавлено!');
          } else {
            alert(xhr.response);
          }
        } else {
          alert("Ошибка " + this.status);
        }
      };
      xhr.send(formData);
    }
  }
</script>