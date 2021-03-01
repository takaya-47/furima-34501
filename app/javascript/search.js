const search = () => {
  const searchButton = document.getElementById("search-button");
  const searchField = document.getElementById("search-field");
  const searchAlert = document.getElementById("search-alert");
  searchButton.addEventListener('click', (e) => {
    if (searchField.value == "") {
      e.preventDefault();
      searchAlert.classList.add("empty-alert");
    }
  });
}

window.addEventListener('load', search);