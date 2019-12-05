function loadFile() {
  let reader = new FileReader();
  reader.onload = (e) => setSolutionCode(reader.result);
  reader.readAsText(codeFile());
}

function setSolutionCode(code) {
  const solutionTextInput = document.getElementById("solution_code");
  solutionTextInput.value = code;
}

function codeFile() {
  const solutionFileInput = document.getElementById("codeFileInput");
  return solutionFileInput.files[0];
}

export { loadFile, codeFile, setSolutionCode };
