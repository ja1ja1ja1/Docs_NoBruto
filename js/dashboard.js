const novoDoc = document.querySelector("#novo-documento")
const buscador = document.querySelector("#inp-bsc")


//funções


//Eventos
console.log(novoDoc);
novoDoc.addEventListener("click", () => {
    document.frm.action = "../Documento.asp"
    document.frm.submit()
})