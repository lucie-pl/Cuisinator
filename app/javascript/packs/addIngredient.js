const addIngredient = () => {
  const addButton = document.getElementById('addIngredient');
  addButton.addEventListener('cocooned:after-insert', e => Cocoooned.create(e.detail.node))
}
export { addIngredient };
