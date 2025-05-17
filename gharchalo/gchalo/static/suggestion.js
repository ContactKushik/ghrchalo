function selectrouteNo() {
  const searchForm = document.getElementById("searchForm");
  searchForm.action = "/gchalo/displayparticularroute/";
  document.getElementById("searchBoxn").placeholder = "Enter Route No";
  document.getElementById("searchBoxn").name = "rno";
  document.getElementById("searchBoxn").type = "number";
  document
    .getElementById("searchBoxn")
    .setAttribute("oninput", "showRSuggestions()");
}

function selectStop() {
  const searchForm = document.getElementById("searchForm");
  searchForm.action = "/gchalo/searchstop/";
  document.getElementById("searchBoxn").placeholder = "Enter Stop";
  document.getElementById("searchBoxn").type = "text";
  document.getElementById("searchBoxn").name = "stop";
  // document.getElementById("searchBoxn").oninput = "stop";
  document
    .getElementById("searchBoxn")
    .setAttribute("oninput", "showSuggestions()");
}

// neeche wale ko loop mein laga de for stop name neeche dekh lena aur example ke liye
let states = [];

// Get the list items and push them into the 'states' array
let listItems = document.querySelectorAll("#statesname li");
listItems.forEach(function (item) {
  states.push(item.textContent);
});

function showSuggestions() {
  const searchBox = document.getElementById("searchBoxn");
  const suggestionsContainer = document.getElementById("suggestions");
  const inputValue = searchBox.value.toLowerCase();
  const suggestions = states.filter((state) =>
    state.toLowerCase().startsWith(inputValue)
  );

  if (inputValue === "") {
    suggestionsContainer.style.display = "none";
  } else {
    suggestionsContainer.style.display = "block";
    suggestionsContainer.innerHTML = "";

    suggestions.forEach((suggestion) => {
      const suggestionElement = document.createElement("div");
      suggestionElement.classList.add("suggestion");
      suggestionElement.innerText = suggestion;
      suggestionElement.addEventListener("click", () => {
        searchBox.value = suggestion;
        suggestionsContainer.style.display = "none";
      });
      suggestionsContainer.appendChild(suggestionElement);
    });
  }
}
// FOR ROUTENO SELECTION
let rnaNames = [];

// Get the list items and push them into the 'rnaNames' array
let rnaListItems = document.querySelectorAll("#rnamess li");
rnaListItems.forEach(function (item) {
  rnaNames.push(item.textContent);
});

function showRSuggestions() {
  const searchBox = document.getElementById("searchBoxn");
  const suggestionsContainer = document.getElementById("suggestions");
  const inputValue = searchBox.value.toLowerCase();
  const suggestions = rnaNames.filter((rnaName) =>
    rnaName.toLowerCase().startsWith(inputValue)
  );

  if (inputValue === "") {
    suggestionsContainer.style.display = "none";
  } else {
    suggestionsContainer.style.display = "block";
    suggestionsContainer.innerHTML = "";

    suggestions.forEach((suggestion) => {
      const suggestionElement = document.createElement("div");
      suggestionElement.classList.add("suggestion");
      suggestionElement.innerText = suggestion;
      suggestionElement.addEventListener("click", () => {
        searchBox.value = suggestion;
        suggestionsContainer.style.display = "none";
      });
      suggestionsContainer.appendChild(suggestionElement);
    });
  }
}



document.addEventListener("click", function (e) {
  const suggestionsContainer = document.getElementById("suggestions");
  if (
    e.target !== suggestionsContainer &&
    !suggestionsContainer.contains(e.target)
  ) {
    suggestionsContainer.style.display = "none";
  }
});
