const initCategoryCheckbox = () => {
  const checkboxes = document.querySelectorAll('.category-checkbox');
  // console.log(checkboxes);
  checkboxes.forEach((checkbox, i) => {
    checkbox.addEventListener("click", (event) => {
      event.currentTarget.classList.toggle('category-checkbox-checked');
    })
  })
}

export { initCategoryCheckbox }