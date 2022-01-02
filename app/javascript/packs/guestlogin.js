  const $window = window;
  const $doc = document;

  const $btnGuest = $doc.getElementById('guest_button');

  const $txtUseremail = $doc.getElementById('user_email');
  const $txtPassword = $doc.getElementById('user_password');

  $btnGuest.addEventListener('click', (e) => {
    //ゲスト(Guest)ボタンをクリックした時、
    //ゲスト用のユーザー名とパスワードを設定する。
    $txtUseremail.value= 'guest@example.com';
    $txtPassword.value= 'guest1234';
  });
