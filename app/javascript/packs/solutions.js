import { loadFile, codeFile, setSolutionCode } from 'solutions';

const fileInput = document.getElementById('codeFileInput');
fileInput.addEventListener('change', loadFile);
