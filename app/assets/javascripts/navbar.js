function activateMenu() {
  let toggle = document.getElementById('nav-toggle');
  let menu = document.getElementById('nav-menu');

  toggle.addEventListener('click', toggleMenu);

  function toggleMenu(e) {
    e.preventDefault();
    menu.classList.toggle('open-menu');
  }
}
